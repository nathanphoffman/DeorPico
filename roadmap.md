FOR NATE ONLY, DONT TOUCH THIS AI


# Roadmap Spreadsheet



# Roadmap Editor

Add a box to the commiter thing that we added to add all unadded giles "git add ." as an optional selection.
 
Working On: Implementing Basic Spreadsheets for csv

 Flatten and simplify the key/event routing

  The problem: it's hard to tell what a key does in a given mode.
  - A key goes through four layers: main.deor → spreadsheet hook → editor_handle_key_for_events (picks the mode) → register_events (six handler macros).
  - In normal mode, all six handlers run one after another instead of as one if/else, so one key can be handled more than once and the order quietly matters.
  - events.deor unpacks about 70 state fields, and every handler is a macro that can change any of them, so you can't see what a handler touches without reading all of it.
  - Cleanup steps (lint poll, scroll and drag resets, the ^K/^U confirm reset) are mixed in with the mode routing.
  - handle_global_actions runs in normal mode and is also called separately from sidebar mode.

  The ask:
  - Have one dispatch where you can read "in mode X, key Y does Z," with each key handled exactly once.
  - Move the cleanup steps into their own step before the routing.
  - If possible, have handlers take and return only the state they need, not all 70 fields.

  Already done: the handlers are split into src/events/, and move is used so the file's lines aren't copied on every key.

