#!/usr/bin/env bash
# Bash 4 / ksh93

printf '%s\n' "Associative arrays exist in AWK as "associative arrays", in Perl as "hashes", in Tcl as "arrays", in Python and C# as "dictionaries", and in Java as a "Map", and in C++11 STL as std::unordered_map."

typeset -A homedir    # Declare associative array
homedir=(             # Compound assignment
    [jim]=/home/jim
    [silvia]=/home/silvia
    [alex]=/home/alex
)

homedir[ormaaj]=/home/ormaaj # Ordinary assignment adds another single element

for user in "${!homedir[@]}"; do   # Enumerate all indices (user names)
    printf 'Home directory of user %s is: %q\n' "$user" "${homedir[$user]}"
done
