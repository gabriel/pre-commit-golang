#!/bin/bash
set -e -u -o pipefail # Fail on error
for file in "$@"; do
    go tool vet $file
done
