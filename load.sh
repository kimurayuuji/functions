#!/usr/bin/env bash
SCRIPT_DIR="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)"
shopt -s nullglob
for f in "$SCRIPT_DIR"/*.sh; do
  [[ "$f" == "$SCRIPT_DIR/load.sh" ]] && continue
  source "$f"
done
