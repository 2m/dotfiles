[[ -f ~/.xinitrc.$(hostname) ]] && source ~/.xinitrc.$(hostname)

# Turn on Num Lock
numlockx

# Load Xresources for xterm customization
[[ -f ~/.Xresources ]] && xrdb -merge -I$HOME ~/.Xresources
[[ -f ~/.Xresources.$(hostname) ]] && xrdb -merge -I$HOME ~/.Xresources.$(hostname)

udiskie &

xautolock -detectsleep -time 3 -locker "slock" -notify 10 -notifier "notify-send -u critical -t 10000 -- 'Locking screen in 10 seconds'" &
nitrogen --restore &
albert &

# Start a WM
exec awesome
