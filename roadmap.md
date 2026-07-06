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

## Nest For AI

We should make it that when pico opens a file, the working folder should be where that file was residing (the folder visible with F1) unless the user specifies a working directory.  Users should also be able to open a specific directory.  So both of these should be viable commands

pico /something/filename.deor    << opens filename with the browser root to something
pico /something    << opens a blank screen with the browser root to something
pico /something/filename.deor /something/src   << opens the filename.deor but the browser actually only shows files deeper in /src.

Can we add a build just command that installs pico to my global environment so I can just run "dpico" anywhere I want to open it?  I think the command sequence for the arguments should be `pico filename working_folder` with working_folder optional as per our discussion.

Can we add two more arguments to deor a script "just run dev" which runs in the working folder and a regular expression "{regex}" which outputs a "{line_number} {file_name}".  The line_number is highlighted if anything is outputted from that prompt in dark orange, using similar highlighting to our search with the original raw line of the output at the top of the file

Add Auto Syntax Check for DeorPico

## For Nate to Figure Out:
Do: file directory folder path needs updating maybe with an arg?  maybe it assumes the working directory of the file opened?
Do: Support better rust highlighting in deor
Do: Merge Recent and Git Diff? -- I am actually finding recent files not very helpful


