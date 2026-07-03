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

- Working: cursor terminates at certain strings

- Next: ctrl + d shifts screen QoL feature

## For Nate
- If holding shift + right arrow go to the end of the line, shift + left arrow, go to the beginning

- If holding ctrl + right arrow, +4 shift, same thing with right arrow, same thing with up down

- Allow selecting a block and tabbing it across the screen

## Next Up For AI

- The user can use F9 to move back a file in history and F12 to move forward a file in history, I think this should be an easy add since we track file history in the file browser.  

- Anytime someone tries to navigate away from a dirty file (unsaved changes) show text in the bottom and turn the bottom color to a dark red to remind them they have action they need to take.  This should be when trying to quit with something like ctrl + q, or when opening the file browser F1, or when moving to the next file.

- Since we have a history it would be cool to be able to use 

- When doing the git diff: ctrl + d it would be nice if the git delta did not shift the content around on the screen, for example I want to be able to use ctrl + d, find the delta, hit ctrl+d and have the viewport still look at that region of code (not have the whole file shift out from under me)

- Quick Prompts (I would like these to open a small centered prompt if we could):
-- ctrl + g should open a goto line # prompt allowing you to enter a line number and it should go there immediately
-- there will also be a search but lets do the easy one for now

- Add markdown highlighting for .md files if it is not provided by our highlighting library

Search Quick Prompts
-- ctrl + f should allow searching for a word in the current code file: when entered, the code should highlight each match on the page and stay highlighted until they hit escape.  Shift tab cycles the search from top to bottom and back again taking you to the line the next is on.  The search highlight should continuously apply as the text is updated so new instances should highlight as the person types adding them to the search list of shift-tabable items.


### v2:
- When a directory is selected in the file browser allow colon (:) to be typed then a : to the right of it will appear where a search string can be typed in, as the letters are entered the files in that directory should filter down by name, once the search is at least 5 letters, immediately flatten the directory and all children directories and show any file names that include the search in their names at the top or even files that just include that search string in their contents (below those at the top) next to the files that should include it should be (instances: 5) or something of that sort to let the user know the number of matches in the file.  Files that match by name should be bolded and held at the top of the directory the : was used on.  Once escape is hit the folder structure should return to normal

### Git diff
- On ctrl + d make it so it toggles the delta of git showing it inline in red text for deleted, green for added, normal system text for nothing.  
When ctrl d is used, a message at the bottom should display the number of changes to the file which might be 0 in which case nothing should happen, 
if there are deltas then the file should be locked from editing until they press ctrl + d again 
-- escape and ctrl + q should also be allowed as an escape hatch to get back to normal mode that way if a user ever panics they can hit escape a bunch to get back to normal