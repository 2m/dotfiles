#xrandr --output DisplayPort-0 --mode 2560x1440 --rate 119.88
#xrandr --output HDMI-0 --mode 1920x1080 --rotate left --right-of DisplayPort-0

xrandr --output HDMI-0 --mode 1920x1080

# Turn on Num Lock
numlockx

# Disable default Caps Lock command
setxkbmap -option ctrl:nocaps

# Load Xresources for xterm customization
[[ -f ~/.Xresources ]] && xrdb -merge -I$HOME ~/.Xresources

# Start a WM
exec awesome
