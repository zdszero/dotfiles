#! /bin/python3

import os

FILE_LIST = [
    # apps
    '~/.config/i3/config',
    '~/.config/i3status/config',
    '~/.config/alacritty/alacritty.yml',
    '~/.config/ranger/*',
    # vim configration
    '~/.config/nvim/*',
    '~/.vim/*.vim',
    '~/.vim/autoload/*',
    # shell
    '~/.zshrc',
    '~/.config/zsh/*',
    '~/.config/fish/*'
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
