# Deor Pico
---
A text editor created by Nathan Hoffman in the language he made Deor: the first large scale test of the language (outside of the Deor transpiler)

The text editor is a terminal editor with mouse-support, that tries to include most features found in other editors including:
- Basic git support (stage, unstage, git file highlighting, git diff views, and commit)
- A file browser (a persistent sidebar with a git-changes section and a name/content filter)
- Syntax highlighting
- Syntax checking (using regular expressions on the terminal output matching to line numbers)
- Mouse support (but also fully native keyboard support as well for mouse-less systems)

## License
---
This is software is licensed under the GPLv3, see: License.md

###
---
How To Install

These instructions are only for Linux at this time because it is tested only for that platform, it may work on other Unix systems like Mac but is untested.

Quick install (requires git and Rust/cargo already installed):
```
curl -sSf https://raw.githubusercontent.com/nathanphoffman/DeorPico/main/setup/install.sh | sh
```
This clones the repo to `~/.local/share/DeorPico` (override with `DEOR_PICO_DIR`), installs `just` and `deor` if missing, and builds/installs `dpico`.

Manual install:
1) Clone the repository
2) ```cd``` to the root of the repository ```cd DeorPico```
3) Run the command ```just install```
4) The file binary will build and install to your home bin directory for execution.
5) Restart your terminal and use the command ```dpico``` to execute it
6) If you run it in a folder it will open the root, you can also specify a command in the form:

THIS FILE IS A WORK IN PROGRESS

###
---
How To Use