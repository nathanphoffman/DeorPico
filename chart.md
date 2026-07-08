# DeorPico Call Chart

Nested list of what each function/macro calls, grouped by source file. `fn` = returns a value / callable with args; `macro` = inline block invoked via `macro_run` (shares caller's local scope, no args/return).

## Entry Point (main.deor, root)

- `main()`
  - `editor_open(launch)` — src/state_init.deor
  - loop:
    - `editor_scroll(state)` — src/renderer/editor/deor_editor.deor
    - `s_visual_col(...)`
    - `initialize_highlighter(ext)` — src/renderer/highlighting.deor (on file change)
    - `xs_run(highlighter, lines)`
    - `get_highlighted_lines(lines, highlights)`
    - `editor_render_diff(state)` or `editor_render(state, ...)` — src/renderer/editor/
    - `xt_read_key()`
    - `editor_translate_key(raw_key)` — src/key_press/keymap.deor
    - `editor_handle_key(state, key)` — src/events.deor (see below, main dispatch tree)

## src/consts.deor

- **use_consts** _macro_
  - _(no internal calls)_
- **editor_reserved_rows** _fn_
  - use_consts
- **editor_view_rows** _fn_
  - editor_reserved_rows
- **sidebar_git_section_rows** _fn_
  - _(no internal calls)_

## src/events.deor

- **back_stop** _macro_
  - _(no internal calls)_
- **handle_diff_mode** _macro_
  - diff_page_down_impl
  - diff_page_up_impl
  - diff_scroll_down_impl
  - diff_scroll_up_impl
  - mouse_down_diff_impl
  - toggle_diff_impl
- **handle_global_actions** _macro_
  - alt_search_char_impl
  - discard_unsaved_changes_impl
  - do_copy_impl
  - do_cut_impl
  - do_paste_impl
  - do_redo_impl
  - do_undo_impl
  - key_quit_impl
  - key_refresh_impl
  - key_save_impl
  - open_lint_output_impl
  - search_clear_impl
  - toggle_diff_impl
  - toggle_line_numbers_impl
- **handle_arrow_nav** _macro_
  - clear_selection_impl
  - key_down_ctrl_impl
  - key_down_impl
  - key_left_ctrl_impl
  - key_left_impl
  - key_right_ctrl_impl
  - key_right_impl
  - key_up_ctrl_impl
  - key_up_impl
  - start_or_extend_selection_impl
- **handle_text_edit** _macro_
  - key_backspace_impl
  - key_char_impl
  - key_delete_impl
  - key_enter_impl
  - key_space_comment_selection_impl
- **handle_tab_and_search** _macro_
  - key_tab_impl
  - search_next_impl
  - search_prev_impl
- **handle_page_and_mouse** _macro_
  - mouse_down_editor_impl
  - mouse_drag_main_impl
  - page_down_impl
  - page_up_impl
  - scroll_down_impl
  - scroll_up_impl
- **editor_handle_key** _fn_
  - apply_lint_poll_impl
  - back_stop
  - handle_arrow_nav
  - handle_diff_mode
  - handle_global_actions
  - handle_lint_output_mode_impl
  - handle_page_and_mouse
  - handle_sidebar_focus_mode
  - handle_tab_and_search
  - handle_text_edit
  - toggle_sidebar

## src/key_press/keymap.deor

- **editor_translate_key** _fn_
  - _(no internal calls)_

## src/lib/clip.deor

- **cp_get** _fn_
  - _(no internal calls)_
- **cp_set** _fn_
  - _(no internal calls)_

## src/lib/convert.deor

- **c_float_to_int** _fn_
  - _(no internal calls)_
- **c_int_to_float** _fn_
  - _(no internal calls)_
- **c_int_to_string** _fn_
  - _(no internal calls)_
- **c_float_to_string** _fn_
  - _(no internal calls)_
- **c_bool_to_string** _fn_
  - _(no internal calls)_
- **c_string_to_int** _fn_
  - _(no internal calls)_
- **c_string_to_float** _fn_
  - _(no internal calls)_
- **c_string_to_bool** _fn_
  - _(no internal calls)_

## src/lib/dirsearch.deor

- **x_filter_shallow** _fn_
  - _(no internal calls)_
- **x_filter_tree** _fn_
  - _(no internal calls)_

## src/lib/file.deor

- **f_list_dir** _fn_
  - _(no internal calls)_
- **e_insert_children** _fn_
  - _(no internal calls)_
- **f_basename** _fn_
  - _(no internal calls)_
- **e_remove_children** _fn_
  - _(no internal calls)_
- **e_remove_at** _fn_
  - _(no internal calls)_
- **e_remove_by_path** _fn_
  - _(no internal calls)_
- **f_read** _fn_
  - _(no internal calls)_
- **f_write** _fn_
  - _(no internal calls)_
- **f_append** _fn_
  - _(no internal calls)_
- **f_exists** _fn_
  - _(no internal calls)_
- **f_is_dir** _fn_
  - _(no internal calls)_
- **f_dirname** _fn_
  - _(no internal calls)_
- **f_lines** _fn_
  - _(no internal calls)_
- **f_delete** _fn_
  - _(no internal calls)_
- **f_trash** _fn_
  - _(no internal calls)_
- **f_dir_is_empty** _fn_
  - _(no internal calls)_
- **f_join_path** _fn_
  - _(no internal calls)_
- **f_extension** _fn_
  - _(no internal calls)_

## src/lib/git.deor

- **use_git_minimap_ansi** _macro_
  - s_join
  - xt_esc
- **g_split_lines** _fn_
  - s_ends_with
  - s_split
  - s_substring
- **g_raw_status** _fn_
  - _(no internal calls)_
- **g_is_repo** _fn_
  - _(no internal calls)_
- **g_classify_status** _fn_
  - _(no internal calls)_
- **g_status** _fn_
  - g_classify_status
  - g_raw_status
  - g_split_lines
  - h_get
  - h_make
  - h_set
  - s_char_at
  - s_substring
  - s_trim
- **g_raw_diff** _fn_
  - _(no internal calls)_
- **g_diff** _fn_
  - g_raw_diff
  - g_split_lines
  - s_starts_with
- **g_diff_count** _fn_
  - s_starts_with
- **g_merge_status** _fn_
  - _(no internal calls)_
- **g_ansi_span** _fn_
  - s_join
  - s_repeat
  - use_git_minimap_ansi
- **g_render_minimap_bar** _fn_
  - g_ansi_span
  - g_merge_status
  - s_join
- **g_diff_status_rows** _fn_
  - s_char_at
- **g_diff_status_raw** _fn_
  - s_char_at
- **g_diff_minimap** _fn_
  - g_diff_status_rows
  - g_render_minimap_bar
- **g_diff_minimap_raw** _fn_
  - g_diff_status_raw
  - g_render_minimap_bar
- **g_sort_entries_by_path** _fn_
  - _(no internal calls)_
- **g_changed_entries** _fn_
  - f_basename
  - g_sort_entries_by_path
  - h_get
  - h_keys
- **g_relative_path** _fn_
  - s_starts_with
  - s_substring
- **g_apply_status** _fn_
  - g_relative_path
  - h_get
- **g_stage** _fn_
  - _(no internal calls)_
- **g_unstage** _fn_
  - _(no internal calls)_
- **g_discard** _fn_
  - _(no internal calls)_
- **g_dir_status_summary** _fn_
  - g_raw_status
  - g_split_lines
  - s_char_at
  - s_join
  - s_starts_with
  - s_substring
  - s_trim

## src/lib/lint.deor

- **lr_make** _fn_
  - _(no internal calls)_
- **lr_run** _fn_
  - _(no internal calls)_
- **lr_poll** _fn_
  - _(no internal calls)_
- **lr_parse_issues** _fn_
  - _(no internal calls)_

## src/lib/list.deor

- **l_T_first** _fn_
  - _(no internal calls)_
- **l_T_last** _fn_
  - _(no internal calls)_
- **l_T_is_empty** _fn_
  - _(no internal calls)_
- **l_T_reverse** _fn_
  - _(no internal calls)_
- **l_T_slice** _fn_
  - _(no internal calls)_
- **l_T_concat** _fn_
  - _(no internal calls)_
- **l_T_contains** _fn_
  - _(no internal calls)_
- **l_T_index_of** _fn_
  - _(no internal calls)_
- **l_T_take** _fn_
  - _(no internal calls)_
- **l_T_drop** _fn_
  - _(no internal calls)_
- **l_T_push** _fn_
  - _(no internal calls)_
- **l_T_pop** _fn_
  - _(no internal calls)_

## src/lib/list_numeric.deor

- **l_T_sum** _fn_
  - _(no internal calls)_
- **l_T_min** _fn_
  - _(no internal calls)_
- **l_T_max** _fn_
  - _(no internal calls)_

## src/lib/list_order.deor

- **l_T_sort** _fn_
  - _(no internal calls)_
- **l_T_unique** _fn_
  - _(no internal calls)_

## src/lib/map.deor

- **h_make** _fn_
  - _(no internal calls)_
- **h_set** _fn_
  - _(no internal calls)_
- **h_get** _fn_
  - _(no internal calls)_
- **h_has** _fn_
  - _(no internal calls)_
- **h_remove** _fn_
  - _(no internal calls)_
- **h_size** _fn_
  - _(no internal calls)_
- **h_keys** _fn_
  - _(no internal calls)_
- **h_values** _fn_
  - _(no internal calls)_

## src/lib/math.deor

- **m_abs** _fn_
  - _(no internal calls)_
- **m_sign** _fn_
  - _(no internal calls)_
- **m_min** _fn_
  - _(no internal calls)_
- **m_max** _fn_
  - _(no internal calls)_
- **m_clamp** _fn_
  - _(no internal calls)_
- **m_pow** _fn_
  - _(no internal calls)_
- **m_absf** _fn_
  - _(no internal calls)_
- **m_minf** _fn_
  - _(no internal calls)_
- **m_maxf** _fn_
  - _(no internal calls)_
- **m_clampf** _fn_
  - _(no internal calls)_
- **m_powf** _fn_
  - _(no internal calls)_
- **m_sqrt** _fn_
  - _(no internal calls)_
- **m_floor** _fn_
  - _(no internal calls)_
- **m_ceil** _fn_
  - _(no internal calls)_
- **m_round** _fn_
  - _(no internal calls)_
- **m_log** _fn_
  - _(no internal calls)_
- **m_log2** _fn_
  - _(no internal calls)_
- **m_log10** _fn_
  - _(no internal calls)_

## src/lib/random.deor

- **m_rand_int** _fn_
  - _(no internal calls)_
- **m_rand_float** _fn_
  - _(no internal calls)_
- **m_rand_bool** _fn_
  - _(no internal calls)_

## src/lib/search.deor

- **x_find_matches** _fn_
  - _(no internal calls)_

## src/lib/string.deor

- **s_trim** _fn_
  - _(no internal calls)_
- **s_to_upper** _fn_
  - _(no internal calls)_
- **s_to_lower** _fn_
  - _(no internal calls)_
- **s_contains** _fn_
  - _(no internal calls)_
- **s_starts_with** _fn_
  - _(no internal calls)_
- **s_ends_with** _fn_
  - _(no internal calls)_
- **s_split** _fn_
  - _(no internal calls)_
- **s_join** _fn_
  - _(no internal calls)_
- **s_join_with** _fn_
  - _(no internal calls)_
- **s_replace** _fn_
  - _(no internal calls)_
- **s_char_at** _fn_
  - _(no internal calls)_
- **s_chars** _fn_
  - _(no internal calls)_
- **s_index_of** _fn_
  - _(no internal calls)_
- **s_substring** _fn_
  - _(no internal calls)_
- **s_repeat** _fn_
  - _(no internal calls)_
- **s_pad_left** _fn_
  - _(no internal calls)_
- **s_pad_right** _fn_
  - _(no internal calls)_
- **s_trim_start** _fn_
  - _(no internal calls)_
- **s_trim_end** _fn_
  - _(no internal calls)_
- **s_visual_col** _fn_
  - _(no internal calls)_
- **s_char_index_from_visual_col** _fn_
  - _(no internal calls)_

## src/lib/syntax.deor

- **xs_make** _fn_
  - _(no internal calls)_
- **xs_from_extension** _fn_
  - _(no internal calls)_
- **xs_add_keyword** _fn_
  - _(no internal calls)_
- **xs_add_bounded** _fn_
  - _(no internal calls)_
- **xs_run** _fn_
  - _(no internal calls)_
- **xs_append** _fn_
  - _(no internal calls)_
- **xs_edit** _fn_
  - _(no internal calls)_
- **xs_insert_line** _fn_
  - _(no internal calls)_
- **xs_remove_line** _fn_
  - _(no internal calls)_
- **xs_line** _fn_
  - _(no internal calls)_

## src/lib/taskpool.deor

- **t_pool_make** _fn_
  - _(no internal calls)_

## src/lib/tasks.deor

- **t_T_run_all** _fn_
  - _(no internal calls)_

## src/lib/term.deor

- **xt_size** _fn_
  - _(no internal calls)_
- **xt_raw_on** _fn_
  - _(no internal calls)_
- **xt_raw_off** _fn_
  - _(no internal calls)_
- **xt_esc** _fn_
  - _(no internal calls)_
- **xt_crlf** _fn_
  - _(no internal calls)_
- **xt_flush_print** _fn_
  - _(no internal calls)_
- **xt_read_key** _fn_
  - _(no internal calls)_

## src/lib/time.deor

- **n_now** _fn_
  - _(no internal calls)_
- **n_now_ms** _fn_
  - _(no internal calls)_
- **n_elapsed** _fn_
  - _(no internal calls)_
- **n_elapsed_ms** _fn_
  - _(no internal calls)_

## src/renderer/browser/browser.deor

- **use_browser_ansi_codes** _macro_
  - s_join
  - use_ansi_codes
- **browser_fit** _fn_
  - s_substring
- **browser_colorize** _fn_
  - s_join
  - use_browser_ansi_codes
- **browser_edit_prefix** _fn_
  - _(no internal calls)_
- **browser_select_wrap** _fn_
  - s_join
  - use_ansi_codes
- **browser_bold_wrap** _fn_
  - s_join
  - use_browser_ansi_codes
- **browser_dim_wrap** _fn_
  - s_join
  - use_browser_ansi_codes
- **browser_gutter** _fn_
  - s_repeat

## src/renderer/browser/keypress/browse.deor

- **refresh_all_git_status** _macro_
  - g_apply_status
  - g_changed_entries
  - g_status
  - clamp_sidebar_selection
- **clamp_sidebar_selection** _macro_
  - compute_editor_layout
  - sidebar_git_section_rows
  - xt_size
- **git_stage_toggle** _macro_
  - g_dir_status_summary
  - g_relative_path
  - g_stage
  - g_unstage
  - refresh_all_git_status
- **file_delete_entry** _macro_
  - f_dir_is_empty
  - f_trash
  - remove_deleted_entry
- **remove_deleted_entry** _macro_
  - e_remove_by_path
  - refresh_all_git_status
- **discard_git_changes_entry** _macro_
  - f_trash
  - g_discard
  - g_relative_path
  - load_file_into_buffer
  - refresh_all_git_status
  - remove_deleted_entry
- **start_create_file** _macro_
  - e_insert_children
  - f_dirname
  - browse_right
- **create_file_char** _macro_
  - s_join
- **create_file_backspace** _macro_
  - s_substring
- **cancel_create_file** _macro_
  - e_remove_at
- **confirm_create_file** _macro_
  - f_exists
  - f_join_path
  - f_write
  - load_file_into_buffer
  - refresh_all_git_status
- **browse_right** _macro_
  - e_insert_children
  - f_list_dir
  - g_apply_status
  - g_status
- **browse_left** _macro_
  - e_remove_children
- **preview_deleted_file** _macro_
  - g_diff
- **load_file_into_buffer** _macro_
  - f_lines
  - main
  - s_join_with
  - refresh_diff_for_new_file
  - refresh_git_diff_lines
  - reset_undo_history
- **discard_unsaved_changes_impl** _macro_
  - load_file_into_buffer

## src/renderer/browser/keypress/browse_filter.deor

- **start_browse_filter** _macro_
  - _(no internal calls)_
- **close_browse_filter** _macro_
  - _(no internal calls)_
- **recompute_browse_filter** _macro_
  - c_int_to_string
  - s_join
  - x_filter_shallow
  - x_filter_tree
- **browse_filter_char** _macro_
  - s_join
  - recompute_browse_filter
- **browse_filter_backspace** _macro_
  - s_substring
  - recompute_browse_filter
- **browse_filter_up** _macro_
  - _(no internal calls)_
- **browse_filter_down** _macro_
  - compute_editor_layout
  - xt_size
- **browse_filter_enter** _macro_
  - load_file_into_buffer
  - notify_unsaved_changes

## src/renderer/editor/ansi_codes.deor

- **use_ansi_codes** _macro_
  - s_join
  - xt_crlf
  - xt_esc

## src/renderer/editor/deor_editor.deor

- **editor_scroll** _fn_
  - compute_editor_layout
  - xt_size

## src/renderer/editor/editor.deor

- **calculate_viewport_dimensions** _macro_
  - editor_selection_range
  - xt_size
- **render_lint_output_section** _macro_
  - editor_render_lint_output
  - s_join
- **editor_render** _fn_
  - build_and_render_status_bar
  - calculate_viewport_dimensions
  - position_and_output_cursor
  - render_buffer_rows
  - render_lint_output_section
  - render_minimap_bar
  - setup_minimap_and_gutters
  - use_ansi_codes

## src/renderer/editor/gutter.deor

- **editor_gutter_width** _fn_
  - c_int_to_string
- **editor_gutter_piece** _fn_
  - c_int_to_string
  - s_join
  - s_pad_left
  - s_repeat

## src/renderer/editor/keypress/backspace.deor

- **look_behind_cursor** _macro_
  - s_substring
- **key_backspace_impl** _macro_
  - s_join
  - s_substring
  - s_trim
  - delete_selection
  - look_behind_cursor
  - push_undo_snapshot

## src/renderer/editor/keypress/char.deor

- **key_char_impl** _macro_
  - input_key

## src/renderer/editor/keypress/delete.deor

- **key_delete_impl** _macro_
  - s_join
  - s_substring
  - delete_selection
  - push_undo_snapshot

## src/renderer/editor/keypress/diff.deor

- **refresh_git_diff_lines** _macro_
  - g_diff
- **refresh_diff_for_new_file** _macro_
  - c_int_to_string
  - g_diff
  - g_diff_count
  - s_join
  - align_diff_scroll
- **toggle_diff_impl** _macro_
  - c_int_to_string
  - g_diff
  - g_diff_count
  - s_join
  - align_diff_scroll
  - align_editor_scroll_from_diff
- **align_diff_scroll** _macro_
  - s_starts_with
  - clamp_diff_scroll
- **align_editor_scroll_from_diff** _macro_
  - editor_scroll
  - s_starts_with
  - clamp_scroll
- **clamp_diff_scroll** _macro_
  - editor_diff_has_minimap
  - editor_view_rows
  - xt_size
- **diff_scroll_up_impl** _macro_
  - clamp_diff_scroll
- **diff_scroll_down_impl** _macro_
  - clamp_diff_scroll
- **diff_page_up_impl** _macro_
  - clamp_diff_scroll
  - use_consts
- **diff_page_down_impl** _macro_
  - clamp_diff_scroll
  - use_consts

## src/renderer/editor/keypress/down.deor

- **key_down_impl** _macro_
  - _(no internal calls)_
- **key_down_ctrl_impl** _macro_
  - use_consts

## src/renderer/editor/keypress/enter.deor

- **key_enter_impl** _macro_
  - delete_selection
  - push_undo_snapshot
  - split_at_cursor

## src/renderer/editor/keypress/left.deor

- **move_left** _macro_
  - _(no internal calls)_
- **key_left_impl** _macro_
  - move_left
- **key_left_ctrl_impl** _macro_
  - move_left
  - use_consts

## src/renderer/editor/keypress/line_numbers.deor

- **toggle_line_numbers_impl** _macro_
  - _(no internal calls)_

## src/renderer/editor/keypress/mouse.deor

- **locate_mouse_in_buffer** _macro_
  - compute_editor_layout
  - m_clamp
  - s_char_index_from_visual_col
  - xt_size
  - use_consts
- **mouse_down_editor_impl** _macro_
  - compute_editor_layout
  - xt_size
  - mouse_down_main
  - sidebar_activate_index
  - use_consts
- **mouse_down_main** _macro_
  - locate_mouse_in_buffer
- **mouse_drag_main_impl** _macro_
  - locate_mouse_in_buffer
- **mouse_down_diff_impl** _macro_
  - compute_editor_layout
  - xt_size
  - sidebar_activate_index
  - use_consts

## src/renderer/editor/keypress/page_up_down.deor

- **page_up_impl** _macro_
  - use_consts
- **page_down_impl** _macro_
  - use_consts

## src/renderer/editor/keypress/quit.deor

- **key_quit_impl** _macro_
  - lr_run
  - notify_unsaved_changes
- **notify_unsaved_changes** _macro_
  - _(no internal calls)_

## src/renderer/editor/keypress/refresh.deor

- **key_refresh_impl** _macro_
  - f_lines
  - s_join_with
  - load_file_into_buffer
  - refresh_all_git_status

## src/renderer/editor/keypress/right.deor

- **move_right** _macro_
  - _(no internal calls)_
- **key_right_impl** _macro_
  - move_right
- **key_right_ctrl_impl** _macro_
  - move_right
  - use_consts

## src/renderer/editor/keypress/save.deor

- **key_save_impl** _macro_
  - f_write
  - lr_run
  - s_join_with
  - refresh_git_diff_lines
  - refresh_sidebar_git_status

## src/renderer/editor/keypress/scroll.deor

- **clamp_scroll** _macro_
  - compute_editor_layout
  - xt_size
- **compute_scroll_sidebar_width** _macro_
  - compute_editor_layout
  - xt_size
- **scroll_up_impl** _macro_
  - clamp_scroll
  - compute_scroll_sidebar_width
  - diff_scroll_up_impl
  - sidebar_scroll_up
  - use_consts
- **scroll_down_impl** _macro_
  - clamp_scroll
  - compute_scroll_sidebar_width
  - diff_scroll_down_impl
  - sidebar_scroll_down
  - use_consts

## src/renderer/editor/keypress/search.deor

- **alt_search_char_impl** _macro_
  - c_int_to_string
  - s_join
  - x_find_matches
  - clear_selection_impl
- **search_clear_impl** _macro_
  - _(no internal calls)_
- **search_jump** _macro_
  - _(no internal calls)_
- **search_next_impl** _macro_
  - search_jump
- **search_prev_impl** _macro_
  - search_jump

## src/renderer/editor/keypress/selection.deor

- **normalize_selection** _macro_
  - _(no internal calls)_
- **start_or_extend_selection_impl** _macro_
  - _(no internal calls)_
- **clear_selection_impl** _macro_
  - _(no internal calls)_
- **key_space_comment_selection_impl** _macro_
  - s_char_at
  - s_index_of
  - s_join
  - s_substring
  - s_trim
  - s_trim_start
  - normalize_selection
  - push_undo_snapshot
- **tab_selection** _macro_
  - normalize_selection
  - push_undo_snapshot
- **delete_selection** _macro_
  - s_join
  - s_substring
  - normalize_selection
- **copy_selection_text** _macro_
  - s_join_with
  - s_substring
  - normalize_selection
- **do_copy_impl** _macro_
  - cp_set
  - copy_selection_text
- **do_cut_impl** _macro_
  - cp_set
  - copy_selection_text
  - delete_selection
  - push_undo_snapshot
- **do_paste_impl** _macro_
  - cp_get
  - s_join
  - s_split
  - s_substring
  - delete_selection
  - push_undo_snapshot

## src/renderer/editor/keypress/sub_macros/input_key.deor

- **input_key** _macro_
  - s_join
  - delete_selection
  - push_undo_snapshot
  - split_at_cursor

## src/renderer/editor/keypress/sub_macros/split_at_cursor.deor

- **split_at_cursor** _macro_
  - s_substring

## src/renderer/editor/keypress/tab.deor

- **key_tab_impl** _macro_
  - input_key
  - tab_selection

## src/renderer/editor/keypress/undo.deor

- **push_undo_snapshot** _macro_
  - _(no internal calls)_
- **do_undo_impl** _macro_
  - _(no internal calls)_
- **do_redo_impl** _macro_
  - _(no internal calls)_
- **reset_undo_history** _macro_
  - _(no internal calls)_

## src/renderer/editor/keypress/up.deor

- **key_up_impl** _macro_
  - _(no internal calls)_
- **key_up_ctrl_impl** _macro_
  - use_consts

## src/renderer/editor/layout.deor

- **editor_has_minimap** _fn_
  - _(no internal calls)_
- **editor_diff_has_minimap** _fn_
  - _(no internal calls)_
- **compute_editor_layout** _fn_
  - editor_gutter_width
  - editor_has_minimap
  - editor_view_rows
  - use_consts

## src/renderer/editor/macros/position_and_output_cursor.deor

- **calculate_clamped_cursor_row** _macro_
  - m_clamp
- **calculate_cursor_screen_column** _macro_
  - _(no internal calls)_
- **format_cursor_escape_code** _macro_
  - c_int_to_string
  - s_join
- **append_cursor_and_output** _macro_
  - s_join
  - xt_flush_print
- **position_and_output_cursor** _macro_
  - append_cursor_and_output
  - calculate_clamped_cursor_row
  - calculate_cursor_screen_column
  - format_cursor_escape_code

## src/renderer/editor/macros/render_buffer_rows.deor

- **render_buffer_rows** _macro_
  - editor_gutter_piece
  - editor_row_has_match
  - editor_row_highlight
  - editor_tint_issue_row
  - editor_tint_search_row
  - render_visible_line
  - s_join
  - sidebar_git_section_rows
  - sidebar_row_piece

## src/renderer/editor/render_visible_line.deor

- **render_visible_line** _fn_
  - s_chars
  - s_join
  - use_ansi_codes

## src/renderer/editor/row_tint.deor

- **editor_row_has_match** _fn_
  - _(no internal calls)_
- **editor_tint_search_row** _fn_
  - s_join
  - s_repeat
  - s_replace
  - use_ansi_codes
- **editor_tint_issue_row** _fn_
  - s_join
  - s_repeat
  - s_replace
  - use_ansi_codes

## src/renderer/editor/rust_diff.deor

- **editor_render_diff** _fn_
  - compute_editor_layout
  - editor_view_rows
  - g_diff_minimap_raw
  - sidebar_git_section_rows
  - sidebar_row_piece

## src/renderer/editor/selection_highlight.deor

- **editor_selection_range** _fn_
  - _(no internal calls)_
- **editor_row_highlight** _fn_
  - _(no internal calls)_

## src/renderer/editor/sidebar.deor

- **toggle_sidebar** _macro_
  - _(no internal calls)_
- **handle_sidebar_focus_mode** _macro_
  - browse_filter_backspace
  - browse_filter_char
  - browse_filter_down
  - browse_filter_enter
  - browse_filter_up
  - browse_left
  - browse_right
  - cancel_create_file
  - close_browse_filter
  - confirm_create_file
  - create_file_backspace
  - create_file_char
  - handle_global_actions
  - mouse_down_editor_impl
  - scroll_down_impl
  - scroll_up_impl
  - sidebar_collapse_git
  - sidebar_delete_entry
  - sidebar_discard_git_changes
  - sidebar_expand_git
  - sidebar_key_activate
  - sidebar_nav_down
  - sidebar_nav_up
  - sidebar_stage_toggle
  - start_browse_filter
  - start_create_file
- **sidebar_stage_toggle** _macro_
  - git_stage_toggle
- **sidebar_delete_entry** _macro_
  - file_delete_entry
- **sidebar_discard_git_changes** _macro_
  - discard_git_changes_entry
- **sidebar_collapse_git** _macro_
  - _(no internal calls)_
- **sidebar_expand_git** _macro_
  - _(no internal calls)_
- **sidebar_nav_up** _macro_
  - sidebar_scroll_follow
- **sidebar_nav_down** _macro_
  - sidebar_scroll_follow
- **sidebar_scroll_follow** _macro_
  - compute_editor_layout
  - sidebar_git_section_rows
  - xt_size
- **sidebar_key_activate** _macro_
  - browse_left
  - browse_right
  - load_file_into_buffer
  - notify_unsaved_changes
  - preview_deleted_file
- **refresh_sidebar_git_status** _macro_
  - g_apply_status
  - g_status
- **use_sidebar_border_colors** _macro_
  - s_join
  - use_ansi_codes
- **sidebar_row_piece** _fn_
  - browser_bold_wrap
  - browser_colorize
  - browser_dim_wrap
  - browser_edit_prefix
  - browser_fit
  - browser_gutter
  - browser_select_wrap
  - c_int_to_string
  - s_join
  - s_repeat
  - use_sidebar_border_colors
- **sidebar_activate_index** _macro_
  - sidebar_git_section_rows
  - sidebar_key_activate
- **sidebar_scroll_up** _macro_
  - _(no internal calls)_
- **sidebar_scroll_down** _macro_
  - compute_editor_layout
  - sidebar_git_section_rows
  - xt_size

## src/renderer/highlighting.deor

- **initialize_highlighter** _fn_
  - xs_add_bounded
  - xs_add_keyword
  - xs_from_extension
  - xs_make
  - use_consts
- **get_highlighted_lines** _fn_
  - xs_line

## src/renderer/status/build_and_render_status_bar.deor

- **build_and_render_status_bar** _macro_
  - c_int_to_string
  - editor_status_shortcuts
  - s_join
  - s_pad_right
  - s_substring

## src/renderer/status/keypress/lint.deor

- **apply_lint_poll_impl** _macro_
  - c_int_to_string
  - lr_parse_issues
  - lr_poll
  - s_join
- **open_lint_output_impl** _macro_
  - _(no internal calls)_
- **close_lint_output** _macro_
  - _(no internal calls)_
- **handle_lint_output_mode_impl** _macro_
  - close_lint_output

## src/renderer/status/lint_output_popup.deor

- **editor_render_lint_output** _fn_
  - s_join
  - s_pad_right
  - s_substring
  - use_ansi_codes
  - use_consts

## src/renderer/status/minimap_gutters.deor

- **initialize_screen_buffer_with_minimap** _macro_
  - _(no internal calls)_
- **setup_minimap_and_gutters** _macro_
  - compute_editor_layout
  - g_diff_minimap
  - initialize_screen_buffer_with_minimap
- **render_minimap_bar** _macro_
  - s_join

## src/renderer/status/status_shortcuts.deor

- **editor_status_shortcuts** _fn_
  - s_join

## src/state_init.deor

- **initialize_core** _macro_
  - f_lines
  - s_join_with
- **initialize_browser** _macro_
  - f_list_dir
  - g_apply_status
  - g_changed_entries
  - g_is_repo
  - g_status
- **initialize_diff** _macro_
  - g_diff
- **initialize_lint** _macro_
  - lr_make
- **initialize_selection** _macro_
  - _(no internal calls)_
- **initialize_undo** _macro_
  - _(no internal calls)_
- **initialize_search** _macro_
  - _(no internal calls)_
- **initialize_filter** _macro_
  - _(no internal calls)_
- **editor_open** _fn_
  - initialize_browser
  - initialize_core
  - initialize_diff
  - initialize_filter
  - initialize_lint
  - initialize_search
  - initialize_selection
  - initialize_undo