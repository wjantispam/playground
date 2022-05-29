#!/usr/bin/env bash

files=(
    a
    b
)
duplicates=()
for f in "${files[@]}"; do
    if cmp -- "$f" other/"$f"; then
        duplicates+=("$f")
    fi
done
if [ "${#duplicates[@]}" -gt 0 ]; then
    rm -- "${duplicates[@]}"
fi