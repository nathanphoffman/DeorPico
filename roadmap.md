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

Working: removing F1 overlay, porting everything to sidebar, removing history -- keeping git

Current Work:

- Should we add a refresh button?  Before toggling between F1 and back would refresh now that might not work? -- what auto refreshes today?

- Allow git to be collapsable

- Final Spot Review

--- 
Needed for MVP
---

- Sometimes the bottom file gets dropped from the git browser, it is just off the screen I can click it by mousing below, does it not respect the status bar?
I should be able to scroll a tad further down.

- Sometimes selections move really slowly performance wise on the screen, like a big drawn selection will start stuttering and slowing down near the end
are we doing like infinitely fast polling or something?  It could also be partly or maybe also because the selection has a pretty big horizontal offset from
 the cursor so it could appear to slow down because I slow the cursor down but it never catches up do to the offset.

- If page down is pressed, auto close the sidebar if it is open

- In diff mode the sidebar cant be clicked if the diff mode is open, allow it to be clicked

- We should talk about improving the git change list: instead of % for edited file, lets get rid of that.  Instead make a file that is both staged 
show twice in the list as two different highlights.  Clicking the unstaged highlighted one will show just unstaged git diff, clicking the staged 
highlighted one will just show staged diff.  If either reverts to normal view, it will show the current file as is and update the cursor to that path 
in the directory (the normal file). In the directory listing the file should show a new color as a yellow-green if both conditions are applied

- Allow git commit to be performed, ^m should toggle a git commit while in the file browser sidebar with currently staged files, a prompt should appear 
(make it a new screen -- which defaults the cursor into a comments: enter confirms, esc should exit)  We should make a new folder called prompt in renderer for this, it could be expanded later on.

- We should add a keyboard key mapping for wrap/unwrap of content ctrl + w? 

---
Not Needed for MVP
---

- Really long files like the rust/build.rs file really lag and slow down when scrolled, is there anything we can do about it?

- Similar to how we provided a regex to match console output messages to syntax highlight and extract aspects of the message, we should have a regex 
that allows matching on F12 inputs.  On any word the cursor is on, the whole word should be compared to the regex to see if it matches any word in any directory with <50 files (ignore directories with more than 50 files), if it does -- the first match will immediately load that file, with our cursor highlight bar (we use for searches) sitting on that line, and the screen moved to it (I think the file search allows this today, and this whole functionality is really similar to how the syntax highlighting works so we should consider extracting some shared logic)

- The git minimap at the bottom seems to have spaces between green bars on new files / fully edited content, shouldn't it be a solid green bar across the 
whole bottom?

## Nest For AI

## V2 Longer Term:
working on: final pass to make sure rust is in deor
working on: more organization
Do: Support better rust highlighting in deor?