# fix mailspring
dbus-update-activation-environment --systemd DISPLAY
eval $(/usr/bin/gnome-keyring-daemon --start --components=pkcs11,secrets,ssh)
export SSH_AUTH_SOCK

# Adjust keyboard typematic delay and rate
xset r rate 270 30

# Start Xorg server at this DPI
xrandr --dpi 190

# Merge & load configuration from .Xresources
xrdb -merge ~/.Xresources

# Let QT and GTK autodetect screen and autoadjust
export QT_AUTO_SCREEN_SCALE_FACTOR=1
export GDK_SCALE=2
export GDK_DPI_SCALE=0.5

[[ -f ~/.Xmodmap ]] && xmodmap ~/.Xmodmap

#fok some wallpaper shiz
export wallp=$(ls /home/g/Pictures/wallpaper/good_ones/* | shuf -n 1) 
feh --bg-fill $wallp
#~/.fehbg &

#F Finally start i3wm
exec i3


