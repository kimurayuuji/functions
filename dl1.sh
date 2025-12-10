function dl1() {
  WIN_USER=$(
    powershell.exe -NoProfile -Command \
      "[Console]::OutputEncoding=[System.Text.Encoding]::UTF8; \$env:UserName" \
    | tr -d '\r'
  )
  pushd "/mnt/c/Users/$WIN_USER/Downloads" > /dev/null
  file="$(ls -t | head -n 1)"
  path="$(wslpath -w $file)"
  explorer.exe "$path"
  popd > /dev/null
}
