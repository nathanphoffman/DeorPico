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

Ready for Testing: Syntax Highlighting
Ready for Testing: Scroll Fix


Add a column that shows staged, and below that unstaged file changes, just in one column that I can click on each file (flattened structure).


Do: leave the search up when going back into F1
Do: file directory folder path needs updating maybe with an arg?  maybe it assumes the working directory of the file opened?
Do some cleanup, specifically of sections and the lib and tab/comment code I added


## Next Up For AI


- When a directory is selected in the file browser allow colon (:) to be typed then a : to the right of it will appear where a search string can be typed in, as the letters are entered the files in that directory should filter down by name, once the search is at least 5 letters, immediately flatten the directory and all children directories and show any file names that include the search in their names at the top or even files that just include that search string in their contents (below those at the top) next to the files that should include it should be (instances: 5) or something of that sort to let the user know the number of matches in the file.  Files that match by name should be bolded and held at the top of the directory the : was used on.  Once escape is hit the folder structure should return to normal.  The order of priority should be file_name match then most instances to least instances of content matches.  
