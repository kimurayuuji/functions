#!/usr/bin/env bash

function gui() {
  filepath=$(wslpath -w "$1")
  if [[ "$2" == "-s" ]]; then
    explorer.exe /select,$filepath
  else
    explorer.exe $filepath
  fi
}
