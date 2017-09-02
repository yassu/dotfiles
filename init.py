#!/usr/bin/env python
# -*- coding: utf-8 -*-
import os
from sys import version_info


if version_info.major == 2:
    input = raw_input


def get_y_or_n(msg=None):
    if msg is not None:
        print(msg)

    ans = input('y or n > ').rstrip()
    if ans == 'y':
        return True
    elif ans == 'n':
        return False
    else:
        print('Please input y or n')


def ln_one_file(filename):
    if os.path.islink('./../' + filename):
        print('There is a simbolic file: {}'.format('./../' + filename))
    else:
        if os.path.exists('./../' + filename):
            over_write = get_y_or_n('Overwrite {}?'.format(filename))
            if over_write:
                os.remove(filename)
        os.symlink(filename[1:], '../{}'.format(filename))


def ln():
    ln_one_file('.bashrc')
    ln_one_file('.gitconfig')
    ln_one_file('.gitignore')
    ln_one_file('.latexmkrc')
    ln_one_file('.profile')
    ln_one_file('.vimrc')


def install_dein():
    if not os.path.exists(os.path.expanduser(
            '~/.vim/dein/repos/github.com/Shoudo/dein.vim')):
        try:
            os.makedirs(os.path.expanduser(
                '~/.vim/dein/repos/github.com/Shougo/dein.vim'))
            os.system('git clone https://github.com/Shougo/dein.vim.git'
                      ' ~/.vim/dein/repos/github.com/Shougo/dein.vim')
        except Exception as ex:
            print(ex)


def init():
    ln()
    install_dein()


if __name__ == '__main__':
    init()
