fundle plugin 'jethrokuan/fzf'
fundle plugin 'oh-my-fish/theme-mtahmed'
fundle plugin '2m/fish-tmux-gitbar'
fundle plugin 'ogham/exa' --path 'contrib'
fundle plugin '2m/fish-exa-aliases'
fundle plugin '2m/fish-gpg-tty'
fundle plugin '2m/fish-jabba'

fundle init

function fish_user_key_bindings
  fzf_key_bindings
end