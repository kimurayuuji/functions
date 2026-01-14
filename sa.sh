#!/usr/bin/env bash

# Screenshot Archive
function sa() {
  SS_DIR="$(
    powershell.exe -NoProfile -Command \
      "[Console]::OutputEncoding=[System.Text.Encoding]::UTF8
      (New-Object -ComObject Shell.Application).NameSpace('shell:Screenshots').Self.Path" \
    | tr -d '\r'
  )"
  SS_DIR=$(wslpath "$SS_DIR")

  pushd "$SS_DIR" > /dev/null
  file="$SS_DIR/$(command ls -t | head -n 1)"
  popd > /dev/null

  mkdir -p $HOME/.sa
  destpath="$HOME/.sa/$(date +%Y%m%d%H%M%S).${file##*.}"
  cp "$file" "$destpath"

  echo "$destpath" | xclip -selection c
  echo "$destpath"
}
