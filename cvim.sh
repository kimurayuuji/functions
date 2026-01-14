#!/usr/bin/env bash

function cvim() {
  ext=${1:-txt}
  temp=$(mktemp --suffix=".$ext")
  xclip -selection c -o | tr -d '\r' >$temp
  nvim $temp --cmd 'cd ~'
}
