#!/bin/bash

set -eu

if [ $# -ne 1 ]; then
  echo "Usage: $0 <go-journal-path>" >&2
  echo "Example: $0 ../go-journal" >&2
  exit 1
fi

GO_JOURNAL_PATH="$1"

if [ ! -d "$GO_JOURNAL_PATH" ]; then
  echo "Error: Directory '$GO_JOURNAL_PATH' does not exist" >&2
  exit 1
fi

DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" >/dev/null 2>&1 && pwd)"
cd "$DIR/.."

go tool goose -out external/Goose -dir "$GO_JOURNAL_PATH" ./...
