set allow-duplicate-variables := true

# Where `just install` copies the built binary -- override by copying
# justfile.local.example to justfile.local (gitignored) and editing it there.
install_dir := env_var('HOME') / '.local/bin'

import? 'justfile.local'

run *args:
    mkdir -p build
    DEOR_LIB=src/lib deor main.deor build/main.rs
    cargo run -- {{args}}

build:
    mkdir -p build
    DEOR_LIB=src/lib deor main.deor build/main.rs
    cargo build

# Builds a release binary and installs it as `dpico` on your PATH --
# usage: dpico [filename] [working_folder]
install:
    mkdir -p build
    DEOR_LIB=src/lib deor main.deor build/main.rs
    cargo build --release
    mkdir -p {{install_dir}}
    cp target/release/DeorPico {{install_dir}}/dpico
    @echo "Installed dpico to {{install_dir}}/dpico"

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

