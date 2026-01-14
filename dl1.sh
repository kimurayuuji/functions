#!/usr/bin/env bash

function dl1() {
  DL_DIR="$(
    powershell.exe -NoProfile -Command \
      "[Console]::OutputEncoding=[System.Text.Encoding]::UTF8
      (New-Object -ComObject Shell.Application).NameSpace('shell:Downloads').Self.Path" \
    | tr -d '\r'
  )"
  DL_DIR=$(wslpath "$DL_DIR")

  pushd "$DL_DIR" > /dev/null
  file="$(command ls -t | head -n 1)"
  filepath="$(wslpath -w $file)"
  explorer.exe "$filepath"
  popd > /dev/null
}
