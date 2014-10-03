#!/usr/bin/env sh
#
# .dotfile
# xorg/xinitrc.symlink


if [ -d /etc/X11/xinit/xinitrc.d ]; then
  for f in /etc/X11/xinit/xinitrc.d/*; do
    [ -x "$f" ] && . "$f"
  done
  unset f
fi


# xresources
if [ -s ~/.Xresources ]; then
    xrdb -merge ~/.Xresources
fi


# xmodmap
if [ -s ~/.Xmodmap ]; then
     xmodmap ~/.Xmodmap
fi


# x programs
xbindkeys &
xautolock -time 10 -locker slock &
#sh ~/.synaptics &
xflux -l 55.43 -g 12.26 -k 3500 &

# asus
sudo asus-kbd-backlight allowusers
asus-kbd-backlight 1

# other services/daemons
#dropboxd &
SpiderOak &

# wallpaper
#feh --bg-scale ~/Pictures/Bakgrunn/arch_linux_bw_wallpaper_by_thales.png
feh --bg-scale ~/Pictures/Bakgrunn/arch_kiss.png


# window manager
#exec $1
#exec awesome
#~/bin/wm/startdwm.sh
#~/bin/wm/startxmonad.sh
exec i3 -c ~/.config/i3/config
