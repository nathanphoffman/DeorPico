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

Linux (tested) / other Unix systems like Mac (untested):

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

Windows (untested, PowerShell):

Requires git and Rust/cargo already installed (get Rust from https://rustup.rs -- accept the default install, which includes the Visual Studio C++ Build Tools it needs to link).

Quick install -- open PowerShell (no need to run it as Administrator) and run:
```
irm https://raw.githubusercontent.com/nathanphoffman/DeorPico/main/setup/install.ps1 | iex
```
This only touches your user profile (no system-wide changes, nothing needs elevated permissions): it clones the repo to `%USERPROFILE%\.local\share\DeorPico` (override with the `DEOR_PICO_DIR` environment variable), installs `deor` if missing, and builds `dpico.exe` into `%USERPROFILE%\.local\bin`, adding that folder to your user `PATH`.

Restart your terminal afterwards and run `dpico` to launch it.

---
Config File

Instead of passing the lint command on the command line, put it in a `.dpico` file in the folder you open (or `~/.config/dpico/config` for all projects). See `.dpico.example`. Settings before any `[section]` apply to every file; a `[ext]` section (like `[ha]`) applies only to that file type and wins over the top-level value. Command-line arguments are the fallback. The same file can also set tab width, scroll amounts, sidebar width and the max file size (listed in `.dpico.example`); those are read at startup, so restart the editor after changing them.
