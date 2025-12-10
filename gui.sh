function gui() {
  path=$(wslpath -w "$1")
  if [[ "$2" == "-s" ]]; then
    explorer.exe /select,$path
  else
    explorer.exe $path
  fi
}
