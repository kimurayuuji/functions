#!/usr/bin/env bash
SCRIPT_PATH=$(realpath "$0")
SCRIPT_DIR=$(dirname "$SCRIPT_PATH")

# bash と zsh でグロブの挙動を設定
if [[ -n ${BASH_VERSION-} ]]; then
  shopt -s nullglob
elif [[ -n ${ZSH_VERSION-} ]]; then
  setopt NULL_GLOB
fi

for f in "$SCRIPT_DIR"/*.sh; do
  [[ "$f" == "$SCRIPT_DIR/load.sh" ]] && continue
  source "$f"
done
