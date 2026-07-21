# Word wrap for the editor pane

## Context

The editor is a terminal app (custom "Deor" language transpiled to Rust,
`crossterm` for raw-mode I/O), not a browser/DOM editor. Today, one buffer
line always maps to exactly one screen row: `render_visible_line`
(`src/renderer/editor/render_visible_line.deor:48-49`) hard-truncates any
line longer than `text_visible_columns` instead of wrapping it, and there is
no horizontal scroll. The goal is VSCode-style behavior instead: long lines
should wrap visually, and the cursor should navigate up/down through the
wrapped visual rows the way it does in VSCode (not jump by raw buffer line,
skipping over wrapped continuations).

This is a real architectural change because `scroll_row`, cursor
positioning, mouse-click mapping, the scrollbar, and gutter numbering all
currently assume "1 buffer line = 1 screen row." All of that needs to become
wrap-aware together, or e.g. the cursor and click targeting will silently
drift from what's drawn.

**Explicitly out of scope** (kept as-is, to bound the change):
- Page Up/Down (`page_up_down.deor`) and Ctrl+Up/Down (`up.deor`/`down.deor`
  ctrl variants) keep jumping by raw buffer lines, not visual rows.
- Home/End are unimplemented today (dead `"home"` event, no `End` capture at
  all in `lib/term.deor`) and stay that way — unrelated pre-existing gap.
- No new on/off toggle — wrap replaces truncation unconditionally, mirroring
  what was asked for.

## Key existing facts that shape the design

- `cursor_col` is a **raw character index** into `BufferState.lines` (real
  `\t` chars, no ANSI). Two existing helpers already convert between that
  and the **visual column** used on screen (tabs expanded to `TAB_WIDTH`):
  `s_visual_col` and `s_char_index_from_visual_col`
  (`src/rust_helper.deor:6,26`). `mouse.deor` already uses this exact
  pattern for click→cursor mapping — reuse it rather than inventing a new
  conversion.
- The string `render_visible_line` actually renders (`lines at
  buffer_row_index` inside `render_buffer_rows.deor:62`) is **not** the raw
  buffer line — it's a synoptic-highlighted, tab-already-expanded, ANSI-
  embedded version (see the comment trail in `consts.deor:5-8` and
  `rust_diff.deor:86-88`: "buffer lines, which synoptic already tab-expands
  before display"). `editor_render`'s local `lines` gets reassigned to this
  highlighted form somewhere before `render_buffer_rows` runs (likely inside
  `setup_minimap_and_gutters` or `calculate_viewport_dimensions` in
  `editor.deor`) — **locate that exact reassignment during implementation**
  so wrap-splitting for display happens on the same string
  `render_visible_line` already handles (ANSI-aware, no tab math needed
  there since tabs are pre-expanded to spaces).
- Because of that split, wrap breakpoints need to be computed **twice**,
  once against the raw line (scroll/cursor/mouse code, which only ever sees
  `BufferState.lines`) and once against the highlighted line (render code) —
  but both can share **one algorithm** if it does tab-expansion AND
  ANSI-escape-skipping in the same walk: on a raw line the ANSI branch is
  simply never triggered; on a highlighted line the tab branch is simply
  never triggered. One function, two call sites, no drift, as long as both
  pass the same `text_visible_columns` from `compute_editor_layout`.

## New module: `src/renderer/editor/wrap.deor`

- `fn intList wrap_break_visual_cols(string line, int width, int tab_width)`
  — walks the string once (copy `render_visible_line`'s ANSI-escape-skip
  block), tracking visible column and expanding `\t` to the next
  `tab_width` stop like `s_visual_col` does. Remembers the most recent
  whitespace visual-column seen since the last break. When the column count
  since the last break would exceed `width`, breaks right after that
  remembered whitespace (or, if none was seen — one long unbroken token —
  hard-breaks exactly at `width`, same fallback as today's truncation, just
  continued instead of dropped). Returns the list of visual-column offsets
  where each new segment starts (empty list = line fits in one segment,
  identical behavior to today).
- Small helpers built on top: segment count for a line, which segment index
  a given visual column falls in, and "step one visual row forward/back"
  from a `(buffer_row, seg_index)` pair (crosses into the
  previous/next buffer line's first/last segment at a line boundary). These
  step helpers are what let scroll-clamping and cursor positioning stay
  O(view_rows) instead of re-wrapping the whole document every frame.

## Rendering path

- **`render_visible_line.deor`**: generalize `render_visible_line` to take
  an explicit `start_visible_col` (today it implicitly starts at 0), so it
  can render just the `[start_visible_col, end_visible_col)` slice of a
  line. It still walks the *whole* line from column 0 internally (so
  ANSI/highlight state carries across a wrap boundary correctly, and
  existing `hl_start`/`hl_end` comparisons need no translation) but only
  emits characters once `visible_cols >= start_visible_col`. Old call sites
  pass `start_visible_col = 0`, preserving current behavior exactly.
- **`render_buffer_rows.deor`**: replace the direct `buffer_row_index =
  scroll_row + row_offset` with a visual-row walk seeded at
  `(scroll_row, scroll_wrap_seg)`, using the wrap helpers to advance one
  visual row per `row_offset` iteration (rolling into the next buffer line
  once a line's segments are exhausted). For each visual row, call the
  generalized `render_visible_line` with that segment's
  `[start_visible_col, end_visible_col)`.
- **`gutter.deor`**: `editor_gutter_piece` gets a bool (e.g.
  `is_first_segment`) so the line number only prints on a wrapped line's
  first visual row, blank on continuations — matches VSCode.
- `editor_row_highlight` / `editor_selection_range`
  (`selection_highlight.deor`) need **no changes** — they already compute
  highlight bounds in whole-line visual-column terms, which is exactly what
  the generalized `render_visible_line` expects.

## Scroll and cursor state

- **`src/models/buffer_state.deor`**: add one field, `int scroll_wrap_seg`
  (which segment of `scroll_row` is topmost), default 0. No goal-column
  field — kept stateless per key-press like the existing `back_stop` clamp,
  since plain (non-wrapped) up/down doesn't track a goal column today
  either and adding that is a separate, unrelated fix.
- **`editor_scroll.deor`**: rewrite the cursor-follow clamp
  (`editor_scroll.deor:26-29`) to compare `(cursor_row, cursor_seg)` against
  `(scroll_row, scroll_wrap_seg)` using the step helpers instead of raw
  integer row math: top-align if the cursor is above the window (same
  intent as today's `scroll_row = cursor_row`), else walk backward from the
  cursor by `view_rows - 1` visual-row steps to compute the new
  `(scroll_row, scroll_wrap_seg)` if the cursor is below the window (same
  intent as today's `scroll_row = cursor_row - view_rows + 1`).
- **`position_and_output_cursor.deor`**: `calculate_clamped_cursor_row`
  needs the visual-row distance between the scroll position and the cursor
  (walk forward, bounded by `view_rows` — the cursor is always kept in view
  by `editor_scroll` already having run this frame) instead of
  `cursor_row - scroll_row`. `calculate_cursor_screen_column` needs
  `cursor_visual_col` to be the column **within the current segment**
  (`whole_line_visual_col - segment_start_visual_col`), not the whole
  line's visual column — find and update whichever call site computes the
  `cursor_visual_col`/`sel_anchor_visual_col` passed into `editor_render`.

## Up/Down navigation

- **`handle_arrow_nav.deor`**: replace the plain `"up"`/`"down"` cases'
  calls to `key_up_impl`/`key_down_impl` (flat `cursor_row ± 1`) with a new
  wrap-aware move: find the cursor's current `(seg_index, visual_col_in_seg)`
  via `s_visual_col` + the wrap breaks for its line, step one visual row via
  the wrap helpers, then land at the same visual column in the target
  segment (clamped to that segment's length) and convert back to a raw
  `cursor_col` via `s_char_index_from_visual_col`. Ctrl+Up/Down keep calling
  the existing flat `key_up_ctrl_impl`/`key_down_ctrl_impl` unchanged (see
  scope note above).
- **`left.deor` / `right.deor`: no changes.** They already move by raw
  character/buffer-line, which is exactly correct even with wrapping — the
  cursor visually continues onto the next/previous screen row automatically
  once rendering is wrap-aware, with zero extra logic needed here.

## Mouse and scrollbar

- **`mouse.deor`**: `locate_mouse_in_buffer` changes from `scroll_row + row`
  to walking forward `row` visual-row steps from `(scroll_row,
  scroll_wrap_seg)` to find the clicked `(buffer_row, segment)`, then
  `s_char_index_from_visual_col(clicked_line, segment_start_visual_col +
  visual_col, TAB_WIDTH)` for the column (adding the segment's own offset
  back in, since that helper expects a whole-line-relative visual column).
- **`scrollbar.deor`**: `compute_scrollbar_thumb` currently sizes/positions
  the thumb from `total_line_count`. For accurate proportions once lines
  can span multiple rows, switch it to total **visual** row count (sum of
  each line's segment count) and the cursor's/scroll's visual-row position
  instead. This is an O(total lines) pass once per frame — cheap next to
  per-frame rendering, but flagging it as the one place doing a full-
  document pass in case it ever matters for very large files.
- `scrollbar_jump_to_row` (`mouse.deor`) updates the same way, mapping the
  click position onto total visual rows instead of `total_line_count`.

## Verification

- Run the existing test suite / build (`cargo build` or however this
  project's transpile+build step is normally invoked — check for a
  Makefile/build script) to make sure the generated Rust still compiles.
- Launch the editor on a file with long lines (including at least one line
  with a tab, one with syntax-highlighted long tokens, and one long
  unbroken token wider than the pane) and manually verify:
  - Long lines wrap at word boundaries instead of getting cut off.
  - Up/Down arrow keys move through wrapped visual rows one at a time.
  - Mouse click on a wrapped continuation row lands the cursor at the right
    character.
  - Line numbers only appear on a wrapped line's first visual row.
  - Selection (shift+arrow, click-drag) highlights correctly across a wrap
    point.
  - Scrollbar thumb size/position still looks right on a file with several
    wrapped lines.
  - Resizing the terminal (changing `text_visible_columns`) re-wraps
    correctly and doesn't leave the cursor/scroll position out of sync.

## Phased implementation

Each phase should build cleanly before moving to the next. Phases 2-3 leave
the app in a visually broken state on purpose (rendering wraps before
cursor/scroll catch up) — that's expected mid-sequence, not a regression to
chase down.

1. **`wrap.deor` core algorithm.** `wrap_break_visual_cols` plus the segment-
   count/segment-index/step-one-visual-row helpers. No call sites touched
   yet. Verify with direct calls against hand-picked strings (plain text,
   tabs, one long unbroken token, ANSI-embedded highlighted text) before
   wiring anything else to it.
   **Why first:** every other phase (rendering, scroll, cursor, mouse,
   scrollbar) calls into this same math. Getting the break/step logic right
   in isolation, with cheap direct-call tests, is far cheaper than debugging
   it live through five call sites at once — and a bug here would otherwise
   surface as a confusing cursor/click/scroll glitch two phases later
   instead of a wrong list of numbers today.
2. **Rendering.** `render_visible_line`'s `start_visible_col` param,
   `render_buffer_rows`'s visual-row walk, `gutter.deor`'s
   `is_first_segment`. Checkpoint: long lines visually wrap and gutter
   numbers only show on first segments. Cursor position and scroll will be
   wrong on wrapped files until phase 3 — expected.
   **Why second:** this is the one visible payoff (lines actually wrap
   instead of truncating), so it's worth reaching as early as possible —
   but it's also the one thing everything else in the plan measures itself
   against. Cursor math, scroll math, and mouse math all need to agree with
   *what got drawn*; doing rendering first gives every later phase a fixed
   target to line up with instead of guessing.
3. **Scroll and cursor state.** `scroll_wrap_seg` field on `BufferState`,
   `editor_scroll`'s clamp, `calculate_clamped_cursor_row` and
   `calculate_cursor_screen_column`. Checkpoint: cursor renders in the
   correct screen cell again, and scroll-follow keeps it in view, on files
   with wrapped lines.
   **Why third:** phase 2 deliberately breaks cursor placement (it now
   renders at a raw-line position that no longer matches the wrapped
   screen), so this phase exists to close that gap immediately rather than
   leave the app in a broken state any longer than needed. It also has to
   land before phase 4, since wrap-aware up/down needs a correct
   `(scroll_row, scroll_wrap_seg)` to step from.
4. **Up/Down navigation.** `handle_arrow_nav`'s wrap-aware move replacing
   the flat `key_up_impl`/`key_down_impl` calls for plain (non-ctrl)
   up/down. Checkpoint: arrow keys step through wrapped visual rows one at
   a time, landing on the same visual column.
   **Why fourth:** this is the main behavior change the user actually
   asked for (cursor should navigate visual rows like VSCode, not skip over
   wrapped continuations) — it comes right after cursor/scroll state
   because it directly reuses the `(buffer_row, seg_index)` stepping that
   phase 3 just made correct, and would be unverifiable before that.
5. **Mouse and scrollbar.** `locate_mouse_in_buffer`, `compute_scrollbar_thumb`,
   `scrollbar_jump_to_row` switched to visual-row math. Checkpoint: clicks
   on wrapped continuation rows land on the right character; scrollbar
   size/position looks right on a file with several wrapped lines.
   **Why fifth:** these are the remaining input paths that still assume
   "1 buffer line = 1 screen row" (click-to-cursor mapping, thumb sizing).
   They're last because they're the least likely to be exercised while
   developing/testing the earlier phases (keyboard-driven), so any bug
   left in them is the one most likely to slip through unnoticed if done
   any earlier — better to sweep them once everything else is stable.
6. **Full verification pass.** Build, then run the full manual test list
   above (word-boundary wrap, tab lines, one long unbroken token, up/down
   across wraps, mouse click on a continuation row, selection across a wrap
   point, scrollbar, terminal resize).
   **Why last:** every earlier checkpoint only verified its own piece in
   isolation. This pass is the one place that exercises all of them
   together in the real terminal app — which is the only way to catch
   drift between what render/scroll/cursor/mouse each *think* is true.
