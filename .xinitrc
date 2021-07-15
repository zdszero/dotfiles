#!/bin/sh

[[ -f ~/.Xmodmap ]] && xmodmap ~/.Xmodmap
[[ -f ~/.xprofile ]] && source ~/.xprofile

if [[ `xrandr | grep "HDMI-1 connected"` ]]; then
  /home/zds/.local/bin/script/setdisplay left
fi

feh --bg-scale ~/.config/i3/manjaro_mountain.jpg &
blueman-applet &
nm-applet &
fcitx5 &
flameshot &
compton &
dunst &
qv2ray &

exec i3
