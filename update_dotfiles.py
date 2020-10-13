#! /bin/python3

import os

FILE_LIST = [
    # i3wm
    '~/.config/i3/*',
    '~/.config/i3status/config',
    # polybar
    '~/.config/polybar/*',
    # alacritty
    '~/.config/alacritty/alacritty.yml',
    # ranger
    '~/.config/ranger/*',
    # vim
    '~/.config/nvim/*',
    '~/.vim/*.vim',
    '~/.vim/autoload/*',
    '~/.config/coc/ultisnips/*',
    # zsh
    '~/.config/zsh/*',
    '~/.zshrc',
    # fish
    '~/.config/fish/*',
    # some config files
    '~/.config/fontconfig/fonts.conf',
    '~/.pylintrc',
    '~/.ideavimrc',
    '~/.gitconfig',
    '~/.local/share/fcitx5/data/*',
    '~/.config/rofi/*'
]

# create directory that doesn't exist
for filepath in FILE_LIST:
    dirs = filepath.split('/')
    curdir = os.getcwd()
    # in the intermediate directory
    for directory in dirs[1:-1]:
        curdir = os.path.sep.join([curdir, directory])
        if not os.path.exists(curdir):
            os.mkdir(curdir)
            print('mkdir: {}'.format(curdir))

for filepath in FILE_LIST:
    dirs = filepath.split('/')
    to_path = os.path.sep.join(dirs[1:-1])
    os.system('cp -r -u {} ./{}'.format(filepath, to_path))
    # print('cp -r -u {} ./{}'.format(filepath, to_path))
