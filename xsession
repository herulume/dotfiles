# Use UTF-8 everywhere
export LANG=en_US.UTF-8

. ./.profile
. ./.bashrc

# load Xresources file
xrdb -merge $HOME/.Xresources

# set your background
feh --randomize --bg-fill $HOME/Pictures/Wallpapers/*

# disable system beep
xset b off

# use caps lock as ctrl key
setxkbmap -option ctrl:nocaps

# set time
while true; do
   xsetroot -name "$( date +"%H%M%S" )"
   sleep 5    # Update time every minute
done &

/bin/bash $HOME/dev/dotfiles/tapping.sh
exec cwm
