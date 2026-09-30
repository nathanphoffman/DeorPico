#!/usr/bin/env bash
# Shell sample
set -eu

NAME="${1:-world}"
COUNT=3
LOG_DIR='/tmp/sample logs'

greet() {
    local who="$1"
    echo "Hello, $who! It's $(date +%H:%M)"
}

for i in $(seq 1 "$COUNT"); do
    if [ "$i" -gt 2 ] && [ -d "$LOG_DIR" ]; then
        greet "$NAME" >> "$LOG_DIR/out.log"
    elif [ "$i" -eq 1 ]; then
        greet "$NAME"
    else
        continue
    fi
done

case "$NAME" in
    world) exit 0 ;;
    *) export LAST_NAME="$NAME" ;;
esac
