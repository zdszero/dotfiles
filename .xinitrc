#!/bin/sh

[[ -f ~/.Xmodmap ]] && xmodmap ~/.Xmodmap
[[ -f ~/.xprofile ]] && source ~/.xprofile
if [[ `xrandr | grep "HDMI-1 connected"` ]]; then
  /home/zds/.local/bin/script/setdisplay left
fi

exec i3
