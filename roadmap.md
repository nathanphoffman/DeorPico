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

Working On: 

When git diff mode is applied it seems like it doesn't matter what file is opened the original file keeps showing itself, i think we should allow git diff mode to remain on but it shouldn't lock to the file that was moded it should allow new files to be selected from the file browser and displayed not selected, ignored, and you see the git diff file you were previously looking at.

## For Nate

Do some cleanup, specifically of sections and the lib and tab/comment code I added

## Next Up For AI

- Holding left-alt while typing a number will automatically go-to that number, it will go to the number as it is typed so while holding alt -> 1 -> goes to line 1.  If still holding alt -> 2 -> goes to line 12, if releasing alt and then pressing it again -> 5 -> goes to line 5 not line 125 (it would have if they didn't release alt) the cursor moves each time a number is entered not when alt is released.
- Similarly typing letters with left alt held will highlight all matches in the text doing a search: same thing each letter while holding alt does this.  If the user hits esc it will unhighlight the text.  Pressing tab while the search is entered will move the cursor to the next nearest search result, shift-tab will go upwards.  Anytime alt is pressed it will immediately deselect any text -- to avoid conflicts with tabbing between selections and a filter made with alt.
- We likely want to show both of these somewhere in the footer bar, so the user knows what was typed in maybe as a notice.


Search Quick Prompts
-- ctrl + f should allow searching for a word in the current code file: when entered, the code should highlight each match on the page and stay highlighted until they hit escape.  Shift tab cycles the search from top to bottom and back again taking you to the line the next is on.  The search highlight should continuously apply as the text is updated so new instances should highlight as the person types adding them to the search list of shift-tabable items.


### v2:
- When a directory is selected in the file browser allow colon (:) to be typed then a : to the right of it will appear where a search string can be typed in, as the letters are entered the files in that directory should filter down by name, once the search is at least 5 letters, immediately flatten the directory and all children directories and show any file names that include the search in their names at the top or even files that just include that search string in their contents (below those at the top) next to the files that should include it should be (instances: 5) or something of that sort to let the user know the number of matches in the file.  Files that match by name should be bolded and held at the top of the directory the : was used on.  Once escape is hit the folder structure should return to normal
