#!/usr/bin/env bash
# The aim of this test is to make sure only one script can run at any one time!
#   we simulate this with two different script, and try to run one after another
#   first_runner.sh

# Bash 4.3 and older chokes on empty arrays with set -u.
set -euo pipefail

this_arg="${0}"
[ -h "$this_arg" ] && init_script_name="$(basename $(readlink $this_arg))"
script_dir=$(cd "$(dirname "${BASH_SOURCE[0]}")" &>/dev/null && pwd -P)

require() { if ! [ -x "$(command -v "$*")" ]; then echo "$* is available and executable"; \
     else echo "Unable to find $*, Exiting ..."; exit 69; fi; }
println() { printf '%s\n' "$*"; }
tmpfile="$(mktemp -t myprog-XXXXXX)"
cleanup() { rm -f "$tmpfile"; }
trap cleanup EXIT # always cleanup the tmp file on exit

require println
require cleanup

println "script_dir is $script_dir"

cmd="$0"
lockfile="$(mktemp -t "$cmd"-XXXX.lock)"
println "lockfile is $lockfile"

exec 100>"$lockfile" || exit 1
flock -n 100 || exit 1
trap 'rm -f /var/tmp/testlock.lock' EXIT


# Now we run the most important task that is going to take a while
sleep 1

# Try to run this again?


exit 0

