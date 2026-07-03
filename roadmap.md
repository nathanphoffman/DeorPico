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

- Working: File History Selection in File Browser "Most Recently Opened Deal"

## For Nate
- If holding shift + right arrow go to the end of the line, shift + left arrow, go to the beginning

- If holding ctrl + right arrow, +4 shift, same thing with right arrow, same thing with up down

- Allow selecting a block and tabbing it across the screen

## Next Up For AI

- Big Bug for some reason the cursor fails when I hit certain strings like the color 

- Quick prompts:
-- ctrl + g should open a goto line # prompt allowing you to enter a line number and it should go there immediately
-- ctrl + f should allow searching for a word in the current code file


### v2:
- When a directory is selected in the file browser allow colon (:) to be typed then a : to the right of it will appear where a search string can be typed in, as the letters are entered the files in that directory should filter down by name, once the search is at least 5 letters, immediately flatten the directory and all children directories and show any file names that include the search in their names at the top or even files that just include that search string in their contents (below those at the top) next to the files that should include it should be (instances: 5) or something of that sort to let the user know the number of matches in the file.  Files that match by name should be bolded and held at the top of the directory the : was used on.  Once escape is hit the folder structure should return to normal

### Git diff
- On ctrl + d make it so it toggles the delta of git showing it inline in red text for deleted, green for added, normal system text for nothing.  
When ctrl d is used, a message at the bottom should display the number of changes to the file which might be 0 in which case nothing should happen, 
if there are deltas then the file should be locked from editing until they press ctrl + d again 
-- escape and ctrl + q should also be allowed as an escape hatch to get back to normal mode that way if a user ever panics they can hit escape a bunch to get back to normal