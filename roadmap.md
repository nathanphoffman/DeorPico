FOR NATE ONLY, DONT TOUCH THIS AI

# Roadmap

- Done: Implement syntax highlighting for deor
- Done: Test syntax highlighting for other languages
- Done: Make it so that enter and space also expand the file browser
- Done: wasd work like arrow keys while in browser mode
- Done: Added Selections
- Done: Git Highlighting
- Done: Organized Structs
- Done: Added git diff refresh everytime F1 is hit
- Done: Allowing undo and redo with ctrl y, ctrl z
- Done: Footer Coloring
- Done: File History Selection in File Browser "Most Recently Opened Deal"
- Done: cursor terminates at certain strings
- Done: ctrl + d shifts screen QoL feature
- Done: F9/F12 move back and forward files
- Done ctrl + del change, error change, and navigate prevention
- Done: Add markdown highlighting for .md files if it is not provided by our highlighting library
- Done: Control plus arrow speed up
- Done: Fixed Tabbing Bug
- Done: Allow selecting a block and tabbing it across the screen
- Done: Allow space bar to comment code, it also preserves additional # in the code block
- Done: Git Diff Mode has been fixed, it now stays in diff mode if other diffs or opened or exits when one non-diff is opened.
- Done: Alt search filter (goto abandoned due to reserved numbers with alts/ctrls/, etc)
- Done: Mouse Clicking
- Done: Colon Searching
- Done: Scroll Fix
- Done: Syntax Highlighting
- Done: New Git Modified Column
- Done: Scroll alignment Fixed
- Done: leave the search up when going back into F1
- Done: git minimap added to the editor
- Done: prevent deleted files from being normally opened, they just show locked out git diff content rather than no content at all
- Done: now supports working folder pathing
- Done: install now installs pico path locally
- Done: two additional arguments added for running dpico
- Done: auto syntax checking for deor
- Done: cursor and selections have been fixed
- Done: added keyboard shortcuts
- Done: added sidebar file system
- Done: meged diff and recent 
- Done: fixed scrolling bugs
- Done: organized editor and renderer, though more org remains
- Done: consolidated gutter logic to struct
- Done: added ctrl 
- Done: most rust is now in deor
- Done: ctrl + b expands and contracts sidebar
- Done: git can now be staged
- Done: git files can now be deleted 
- Done: deleted files show in git history and can be staged / unstaged
- Done: double confirm for delete and discard
- Done: minimap bar moved to bottom
- Done: more editor code broken out
- Done: sidebar is its own folder
- Done: F1 browser completely gone, sidebar click fix in place
- Done: Refresh button added and tested
- Done: GIT is collapsable
- Done: Git diff does not lock sidebar any longer
- Done: Finding out why the last item of the browser is cut off
- Done: Splitting out more files into macros
- Done: Split really simple macros into functions
- Done: mv has been added
- Done: dir creates a folder
- Done: drag selection gone
- Done: alt + click selection in
- Done: Add ctrl + a To Select All
- Done: alt search is fixed
- Done: Slow Git Diff Scroll

Working on: - Any file more than 2000 lines long we should prevent from opening maybe?

- Implement back-indentation shift + tab

- clicking on a file when there is a save prompt in progress should refuse selection of the file you want to go to until you 
take action.

- On ctrl + s refresh the file browser view -- i think we do this today but might be good for capturing external changes

- Auto close sidebar on page up or page down

- Pair with AI
 
 - When the editor starts up the directory sidebar should be selected
 
- Extract Sidebar into its own folder

Probably better done by AI, required items:
---

Performance of big files, even just 400 lines or so can really slow performance when scrolling, typing, selecting, etc

File search results should have mouse support

Sometimes selection seem to get overwhelmed and buggy

For wrapping text can we do something

- We should talk about improving the git change list: instead of % for edited file, lets get rid of that.  
Instead make a file that is both staged and unstaged
show twice in the list as two different highlights.  Clicking the unstaged highlighted one will show 
just unstaged git diff, clicking the staged 
highlighted one will just show staged diff.  If either reverts to normal view, it will show the current 
file as is and update the cursor to that path 
in the directory (the normal file). In the directory listing the file should show twice as well in two different colors. 
Make sure the unstaged one is the only one that can be marked for deletion, I think that makes sense?  Then when staged 
it will update accordingly to show a deletion is staged.

It is a possible there could be an issue with scrolling to the end of a file -- just scrolling best_practices crashes in the 
DeorLang

---
Lower Priority
---
- Add paste event for better windows support
  - Fix worth considering: enable crossterm's bracketed-paste mode (EnableBracketedPaste in xt_raw_on,
  handle crossterm::event::Event::Paste(String) in xt_read_key) — many terminals (including Windows
  Terminal) route native paste through that protocol as one atomic blob regardless of the Ctrl+V
  interception, so you'd get one clean paste event instead of N keystrokes. term.deor doesn't handle
  Event::Paste at all right now, so it's currently silently dropped by the _ => continue fallback if a
  terminal does send it.

 - Add an extra space to the bottom of the file browser history, so it always scrolls if it looks close to the bottom 
so users know there is nothing missing if they scroll down

- Allow git commit to be performed, ^m should toggle a git commit while in the file browser sidebar with currently staged files, a prompt should appear 
(make it a new screen -- which defaults the cursor into a comments: enter confirms, esc should exit)  We should make a new folder called prompt in renderer for this, it could be expanded later on.

- The git minimap at the bottom seems to have spaces between green bars on new files / fully edited content, shouldn't it be a solid green bar across the 
whole bottom?

- Similar to how we provided a regex to match console output messages to syntax highlight and extract aspects of the message, we should have a regex 
that allows matching on F12 inputs.  On any word the cursor is on, the whole word should be compared to the regex to see if it matches any word in any directory with <50 files (ignore directories with more than 50 files), if it does -- the first match will immediately load that file, with our cursor highlight bar (we use for searches) sitting on that line, and the screen moved to it (I think the file search allows this today, and this whole functionality is really similar to how the syntax highlighting works so we should consider extracting some shared logic)

- Allow arrow keys to work in ctrl + r

## V2 Longer Term:
working on: final pass to make sure rust is in deor
working on: more organization
Do: Support better rust highlighting in deor?