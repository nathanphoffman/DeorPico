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
- Done: Git Bar not being solid
- Done: File search results should have proper mouse support
- Done: auto-set alt text search based on file search
- Done: clicking on a file when there is a save prompt in progress should lock out
- Done: Text wrap bug should be fixed
- Done: other lang syntax highlighting added
- Done: built windows client
- Done: more organization
- Done: rename feature added
- Done: tons of organization

- We should make file search more obvious that it is enabled, the inner file alt search with a reminder to press tab to cancel.  Maybe a red bar over the 
status bar?  is that a hard add?

- Implement back-indentation shift + tab

---
## Lower Priority
---

- Similar to how we provided a regex to match console output messages to syntax highlight and extract aspects of the message, we should have a regex 
that allows matching on F12 inputs.  On any word the cursor is on, the whole word should be compared to the regex to see if it matches any word in any directory with <50 files (ignore directories with more than 50 files), if it does -- the first match will immediately load that file, with our cursor highlight bar (we use for searches) sitting on that line, and the screen moved to it (I think the file search allows this today, and this whole functionality is really similar to how the syntax highlighting works so we should consider extracting some shared logic)

- If I delete a file with k-k and then hit crtl + s to save it it gets added back into the GIT list, rare but odd behavior

- Allow arrow keys to work in ctrl + r

- Add word select / copy

- There is perhaps an odd issue with searching where if not cleared tab might call a highlight while holding shift?  It is 
a very specific bug has to be a search filter, I am guessing the tab moves the cursor hence the highlight

- Allow git commit to be performed, ^m should toggle a git commit while in the file browser sidebar with currently staged files, a prompt should appear 
(make it a new screen -- which defaults the cursor into a comments: enter confirms, esc should exit)  We should make a new folder called prompt in renderer for this, it could be expanded later on.

- Maybe make alt (like shift) both work for arrow keys selections so it mirrors the current alt + click today?

- We should talk about improving the git change list: instead of % for edited file, lets get rid of that.  
Instead make a file that is both staged and unstaged
show twice in the list as two different highlights.  Clicking the unstaged highlighted one will show 
just unstaged git diff, clicking the staged 
highlighted one will just show staged diff.  If either reverts to normal view, it will show the current 
file as is and update the cursor to that path 
in the directory (the normal file). In the directory listing the file should show twice as well in two different colors. 
Make sure the unstaged one is the only one that can be marked for deletion, I think that makes sense?  Then when staged 
it will update accordingly to show a deletion is staged.
