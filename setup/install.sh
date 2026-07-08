#!/bin/sh
set -e

if ! command -v git >/dev/null 2>&1; then
	echo "git is required -- install it first" >&2
	exit 1
fi

if ! command -v cargo >/dev/null 2>&1; then
	echo "Rust/cargo is required -- install it first: https://rustup.rs" >&2
	exit 1
fi

if ! command -v just >/dev/null 2>&1; then
	echo "Installing just..."
	cargo install just
fi

if ! command -v deor >/dev/null 2>&1; then
	echo "Installing deor..."
	curl -sSf https://raw.githubusercontent.com/nathanphoffman/DeorLang/main/setup/install-deor.sh | sh
fi

CLONE_DIR="${DEOR_PICO_DIR:-$HOME/.local/share/DeorPico}"
if [ -d "$CLONE_DIR/.git" ]; then
	echo "Updating existing DeorPico checkout at $CLONE_DIR..."
	git -C "$CLONE_DIR" pull
else
	echo "Cloning DeorPico into $CLONE_DIR..."
	git clone https://github.com/nathanphoffman/DeorPico "$CLONE_DIR"
fi

cd "$CLONE_DIR"
just install
