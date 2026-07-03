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

- When git diff mode is applied it seems like it doesn't matter what file is opened the original file keeps showing itself, i think we should allow git diff mode to remain on but it shouldn't lock to the file that was moded it should allow new files to be selected from the file browser and displayed not selected, ignored, and you see the git diff file you were previously looking at.

## For Nate
- If holding shift + right arrow go to the end of the line, shift + left arrow, go to the beginning
- If holding ctrl + right arrow, +4 shift, same thing with right arrow, same thing with up down
- Allow selecting a block and tabbing it across the screen

## Next Up For AI

- Quick Prompts (I would like these to open a small centered prompt if we could):
-- ctrl + g should open a goto line # prompt allowing you to enter a line number and it should go there immediately
-- there will also be a search but lets do the easy one for now

Search Quick Prompts
-- ctrl + f should allow searching for a word in the current code file: when entered, the code should highlight each match on the page and stay highlighted until they hit escape.  Shift tab cycles the search from top to bottom and back again taking you to the line the next is on.  The search highlight should continuously apply as the text is updated so new instances should highlight as the person types adding them to the search list of shift-tabable items.


### v2:
- When a directory is selected in the file browser allow colon (:) to be typed then a : to the right of it will appear where a search string can be typed in, as the letters are entered the files in that directory should filter down by name, once the search is at least 5 letters, immediately flatten the directory and all children directories and show any file names that include the search in their names at the top or even files that just include that search string in their contents (below those at the top) next to the files that should include it should be (instances: 5) or something of that sort to let the user know the number of matches in the file.  Files that match by name should be bolded and held at the top of the directory the : was used on.  Once escape is hit the folder structure should return to normal
