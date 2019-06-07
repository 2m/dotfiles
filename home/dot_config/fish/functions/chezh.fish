function chezh
  # prompt for login, if logged out
  lpass ls --sync=no > /dev/null
  chezmoi -c ~/.local/share/chezmoi/chezmoi-home.toml $argv
end
