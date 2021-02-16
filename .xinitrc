#!/bin/sh

export EDITOR='nvim'
export PAGER='less'
export SHELL='zsh'
export BROWSER='chromium'
export PATH="$PATH:/home/zds/.local/bin:/home/zds/.local/bin/script"
export INPUT_METHOD=fcitx5
export GTK_IM_MODULE=fcitx5
export QT_IM_MODULE=fcitx5
export XMODIFIERS="@im=fcitx5"
export QT_QPA_PLATFORMTHEME=qt5ct
export SOCKS_VERSION=5
export SOCKS_SERVER="127.0.0.1:1080"

[[ -f ~/.xprofile ]] && source ~/.xprofile
[[ -f ~/.Xmodmap ]] && xmodmap ~/.Xmodmap
if [[ `xrandr | grep "HDMI-1 connected"` ]]; then
  /home/zds/.local/bin/script/setdisplay hdmi
fi

exec i3
