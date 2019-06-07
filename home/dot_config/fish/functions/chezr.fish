function chezr
  # prompt for login, if logged out
  lpass ls --sync=no > /dev/null
  chezmoi -c ~/.local/share/chezmoi/chezmoi-root.toml $argv
end
