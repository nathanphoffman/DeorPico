FOR NATE ONLY, DONT TOUCH THIS AI

# Roadmap

Working On: Implementing Basic Spreadsheets for csv

Clean up the browse.deor file in render - > keymap

---
## Lower Priority
---

- We should talk about improving the git change list: instead of % for edited file, lets get rid of that.  
Instead make a file that is both staged and unstaged
show twice in the list as two different highlights.  Clicking the unstaged highlighted one will show 
just unstaged git diff, clicking the staged 
highlighted one will just show staged diff.  If either reverts to normal view, it will show the current 
file as is and update the cursor to that path 
in the directory (the normal file). In the directory listing the file should show twice as well in two different colors. 
Make sure the unstaged one is the only one that can be marked for deletion, I think that makes sense?  Then when staged 
it will update accordingly to show a deletion is staged.

- Allow git commit to be performed, ^m should toggle a git commit while in the file browser sidebar with currently staged files, a prompt should appear 
(make it a new screen -- which defaults the cursor into a comments: enter confirms, esc should exit)  We should make a new folder called prompt in renderer for this, it could be expanded later on.

- Maybe make alt (like shift) both work for arrow keys selections so it mirrors the current alt + click today?


---
## Lowest Priority
---
Questionable determined to be doable but it would change a lot of syntax from deor to wrapped methods, write now we do a handful of clones, 
it is ON not ON^2 We should talk about having the lines be a ref and do more moves for better performance, but there is no rush


Some work has already been done for this but we could improve it:
Flatten and simplify the events at the top level, it might be the most confusing part of the code right now.

- Allow arrow keys to work in ctrl + r


