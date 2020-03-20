#! /usr/bin/bash

cp ~/.vimrc vimrc
cp /etc/bash.bashrc bash.bashrc
cp ~/.tmux.conf tmux.conf
cp ~/.gitconfig gitconfig
cp ~/.config/i3/config i3
git add -A .
git commit -m "update"
git push
