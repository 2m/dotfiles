[[ -f ~/.xinitrc.$(hostname) ]] && source ~/.xinitrc.$(hostname)

# Turn on Num Lock
numlockx

# Load Xresources for xterm customization
[[ -f ~/.Xresources ]] && xrdb -merge -I$HOME ~/.Xresources
[[ -f ~/.Xresources.$(hostname) ]] && xrdb -merge -I$HOME ~/.Xresources.$(hostname)

udiskie &

nitrogen --restore &
albert &
rescuetime &

# Start a WM
exec awesome
