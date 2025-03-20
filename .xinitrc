#!/bin/sh

userresources=$HOME/.Xresources
usermodmap=$HOME/.Xmodmap
sysresources=/etc/X11/xinit/.Xresources
sysmodmap=/etc/X11/xinit/.Xmodmap

# merge in defaults and keymaps

if [ -f $sysresources ]; then







    xrdb -merge $sysresources

fi

if [ -f $sysmodmap ]; then
    xmodmap $sysmodmap
fi

if [ -f "$userresources" ]; then







    xrdb -merge "$userresources"

fi

if [ -f "$usermodmap" ]; then
    xmodmap "$usermodmap"
fi

# start some nice programs

if [ -d /etc/X11/xinit/xinitrc.d ] ; then
 for f in /etc/X11/xinit/xinitrc.d/?*.sh ; do
  [ -x "$f" ] && . "$f"
 done
 unset f
fi

# twm &
#xclock -geometry 50x50-1+1 &
#xterm -geometry 80x50+494+51 &
#xterm -geometry 80x20+494-0 &
# exec xterm -geometry 80x66+0+0 -name login
xset s off
xset -dpms
xset s noblank
# xmodmap -e "keycode 13 = 4 EuroSign 4 EuroSign"
# FIXME: We also have .screenlayout/home.sh from 2022 that I forgot about at some point?
# Do we want to do this in .i3/config instead?
xrandr --output DP-4 --mode 2560x1440 --rate 143.86 --pos 0x354
xrandr --output HDMI-0 --right-of DP-4 --rotate right --pos 2560x0
exec i3
