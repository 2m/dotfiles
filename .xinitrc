[[ -f ~/.xinitrc.$(hostname) ]] && source ~/.xinitrc.$(hostname)

# Turn on Num Lock
numlockx

# Disable default Caps Lock command
setxkbmap -option ctrl:nocaps

# Load Xresources for xterm customization
[[ -f ~/.Xresources ]] && xrdb -merge -I$HOME ~/.Xresources
[[ -f ~/.Xresources.$(hostname) ]] && xrdb -merge -I$HOME ~/.Xresources.$(hostname)

udiskie &

nitrogen --restore &

# Start a WM
exec awesome
