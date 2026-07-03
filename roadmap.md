FOR NATE ONLY, DONT TOUCH THIS AI

# Roadmap

- Done: Implement syntax highlighting for deor
- Done: Test syntax highlighting for other languages
- Done: Make it so that enter and space also expand the file browser
- Done: wasd work like arrow keys while in browser mode

## Next Up
- A file history allowing you to simply tab to, the top of the history shows you what you last opened, the history should also have the same highlighting so the files listed should be say yellow if recently edited -- unstaged commits

### Git highlighting
- Make it so the file explorer shows:
    - Normally Standard Just As Today
    - Green for a file that is staged in git
    - Yellow for a file that has been edited
    - Red for a file that has errors (don't worry about detecting errors we will set that up)
^ I am thinking that we can probably use git commands to determine this with a git rust wrapper?  not sure the best way
At some point I want to do a diff view, no reason to do that code now, but worthy of thinking about as our git plan

### Git diff
- On ctrl + d make it so it toggles the delta of git showing it inline in red text for deleted, green for added, normal system text for nothing.  When ctrl d is used, a message at the bottom should display the number of changes to the file which might be 0 in which case nothing should happen, if there are deltas then the file should be locked from editing until they press ctrl + d again