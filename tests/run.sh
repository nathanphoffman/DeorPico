#!/bin/sh
# Runs every tests/unit_tests/*.deor: transpile, compile, run, then compare
# stdout to the "# expect:" comment block at the bottom of the file.
# Usage: tests/run.sh   (from the repo root, or via `just test`)
cd "$(dirname "$0")/.." || exit 1
out=$(mktemp -d)
trap 'rm -rf "$out"' EXIT
pass=0
fail=0
for src in tests/unit_tests/*.deor; do
    name=$(basename "$src" .deor)
    if ! DEOR_LIB=lib deor "$src" "$out/$name.rs" > "$out/$name.log" 2>&1; then
        echo "FAIL $name (transpile)"; cat "$out/$name.log"; fail=$((fail + 1)); continue
    fi
    if ! rustc -o "$out/$name" "$out/$name.rs" > "$out/$name.log" 2>&1; then
        echo "FAIL $name (rustc)"; grep -A5 '^error' "$out/$name.log" | head -20; fail=$((fail + 1)); continue
    fi
    "$out/$name" > "$out/$name.actual" 2>&1
    sed -n '/^# expect:/,$p' "$src" | tail -n +2 | sed 's/^# \{0,1\}//' > "$out/$name.expected"
    if diff "$out/$name.expected" "$out/$name.actual" > "$out/$name.diff"; then
        echo "ok   $name"; pass=$((pass + 1))
    else
        echo "FAIL $name"; cat "$out/$name.diff"; fail=$((fail + 1))
    fi
done
echo "$pass passed, $fail failed"
[ "$fail" -eq 0 ]
