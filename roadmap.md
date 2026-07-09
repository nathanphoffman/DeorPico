FOR NATE ONLY, DONT TOUCH THIS AI

# Roadmap

- Done: alt + click selection in
- Done: Add ctrl + a To Select All
- Done: alt search is fixed
- Done: Fixed Slow Git Diff Scroll
- Done: Large Files now process correctly
- Done: Sidebar now defaulted
- Done:  Alt needs to support underscores
- Done: Auto close sidebar on page up or page down
- Done: ctrl + s refreshes the git file browser

Working On: Git Bar not being solid

Working Next: File search results should have mouse support

- Implement back-indentation shift + tab

- clicking on a file when there is a save prompt in progress should refuse selection of the file you want to go to until you 
take action.

- Extract Sidebar into its own folder

- Similar to how we provided a regex to match console output messages to syntax highlight and extract aspects of the message, we should have a regex 
that allows matching on F12 inputs.  On any word the cursor is on, the whole word should be compared to the regex to see if it matches any word in any directory with <50 files (ignore directories with more than 50 files), if it does -- the first match will immediately load that file, with our cursor highlight bar (we use for searches) sitting on that line, and the screen moved to it (I think the file search allows this today, and this whole functionality is really similar to how the syntax highlighting works so we should consider extracting some shared logic)


---
Lower Priority
---

- Text needs proper wrapping

- There is perhaps an odd issue with searching where if not cleared tab might call a highlight while holding shift?  It is 
a very specific bug has to be a search filter, I am guessing the tab moves the cursor hence the highlight

- Add paste event for better windows support
  - Fix worth considering: enable crossterm's bracketed-paste mode (EnableBracketedPaste in xt_raw_on,
  handle crossterm::event::Event::Paste(String) in xt_read_key) — many terminals (including Windows
  Terminal) route native paste through that protocol as one atomic blob regardless of the Ctrl+V
  interception, so you'd get one clean paste event instead of N keystrokes. term.deor doesn't handle
  Event::Paste at all right now, so it's currently silently dropped by the _ => continue fallback if a
  terminal does send it.

- Allow git commit to be performed, ^m should toggle a git commit while in the file browser sidebar with currently staged files, a prompt should appear 
(make it a new screen -- which defaults the cursor into a comments: enter confirms, esc should exit)  We should make a new folder called prompt in renderer for this, it could be expanded later on.

- Allow arrow keys to work in ctrl + r

- Add word select / copy

- We should talk about improving the git change list: instead of % for edited file, lets get rid of that.  
Instead make a file that is both staged and unstaged
show twice in the list as two different highlights.  Clicking the unstaged highlighted one will show 
just unstaged git diff, clicking the staged 
highlighted one will just show staged diff.  If either reverts to normal view, it will show the current 
file as is and update the cursor to that path 
in the directory (the normal file). In the directory listing the file should show twice as well in two different colors. 
Make sure the unstaged one is the only one that can be marked for deletion, I think that makes sense?  Then when staged 
it will update accordingly to show a deletion is staged.


## V2 Longer Term:
working on: final pass to make sure rust is in deor
working on: more organization
Do: Support better rust highlighting in deor?