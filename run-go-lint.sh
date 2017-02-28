#!/bin/bash
#
# Capture and print stdout/stderr, since golint doesn't use proper exit codes
#
set -e

exec 5>&1
for file in "$@"; do
    output="$(golint "$file" 2>&1 | grep -v ^go/vendor | grep -v ^go/protocol | grep -v comment | grep -v KeysById | grep -v "error should be the last type" | grep -v stutters | grep -v "error strings should not be capitalized" | tee /dev/fd/5)"
    [[ -z "$output" ]]
done
