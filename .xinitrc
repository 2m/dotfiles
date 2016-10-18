xrandr --output DisplayPort-0 --mode 2560x1440 --rate 119.88
xrandr --output DVI-0 --mode 1920x1080 --rotate left --left-of DisplayPort-0
xrandr --output HDMI-0 --mode 1280x1024 --right-of DisplayPort-0

# Turn on Num Lock
numlockx

# Disable default Caps Lock command
setxkbmap -option ctrl:nocaps

# Load Xresources for xterm customization
[[ -f ~/.Xresources ]] && xrdb -merge -I$HOME ~/.Xresources

udiskie &

imwheel

# Start a WM
exec awesome
