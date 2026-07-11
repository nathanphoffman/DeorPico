set allow-duplicate-variables := true

# Where `just install` copies the built binary -- override by copying
# justfile.local.example to justfile.local (gitignored) and editing it there.
install_dir := env_var('HOME') / '.local/bin'

import? 'justfile.local'

run *args:
    mkdir -p build
    DEOR_LIB=lib deor main.deor build/main.rs
    cargo run -- {{args}}

build:
    mkdir -p build
    DEOR_LIB=lib deor main.deor build/main.rs
    cargo build

# Wipes build/ (deor's transpiled output) and target/ (cargo's incremental
# cache) first -- `build` on its own always regenerates build/main.rs fresh
# but reuses target/ incrementally, so this is the one to reach for when
# ruling out a stale Cargo cache as a variable.
rebuild:
    rm -rf build target
    mkdir -p build
    DEOR_LIB=lib deor main.deor build/main.rs
    cargo build

# Builds a release binary and installs it as `dpico` on your PATH --
# usage: dpico [filename] [working_folder]
install:
    mkdir -p build
    DEOR_LIB=lib deor main.deor build/main.rs
    cargo build --release
    mkdir -p {{install_dir}}
    cp target/release/DeorPico {{install_dir}}/dpico
    @echo "Installed dpico to {{install_dir}}/dpico"

# Opens this repo in your installed dpico, rebuilding/reinstalling it first
# so you're always editing with your own latest changes. Wires `just build`
# in as the on-save lint command -- deor's own transpile-validation errors
# (e.g. "[validation] path line N: ...") get parsed back into orange
# highlights on the offending line. Note: this only catches validation
# errors -- if deor validation passes but rustc then fails on the
# *generated* build/main.rs, that error's line numbers point into the
# generated file, not back into the .deor source, so it won't highlight.
edit: install
    dpico . . "just build" '\[validation\] (\S+) line ([0-9]+):'

update-deor-with-latest:
    curl -sSf https://raw.githubusercontent.com/nathanphoffman/DeorLang/main/setup/update.sh | sh

install-deor:
    curl -sSf https://raw.githubusercontent.com/nathanphoffman/DeorLang/main/setup/install-deor.sh | sh

install-ext:
    #!/bin/sh
    TMP="$(mktemp -d)"
    curl -sL "https://github.com/nathanphoffman/DeorLang/archive/refs/heads/main.tar.gz" | tar xz -C "$TMP"
    code --install-extension "$(ls "$TMP/DeorLang-main/deor-vscode/"*.vsix | tail -1)"
    rm -rf "$TMP"
    echo "Done — reload VS Code window to apply (Ctrl+Shift+P → Reload Window)."
