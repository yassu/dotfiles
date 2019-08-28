#!/bin/sh

## このスクリプトを動かす前にbrewとgitをインストールしておくこと

brew upgrade
brew install tmux neovim

# install git-completion.bash
if [ ! -e "${HOME}/.git-completion.bash" ]; then
    echo "Install git-completion"
    `curl https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.bash -o ~/.git-completion.bash`
fi

# install pyenv
if [ ! -e "${HOME}/.pyenv" ]; then
    echo "Install pyenv"

    `git clone git://github.com/yyuu/pyenv.git ~/.pyenv`
    `git clone https://github.com/pyenv/pyenv-virtualenv.git ~/.pyenv/plugins/pyenv-virtualenv`
    `~/.pyenv/plugins/python-build/install.sh`
    py_new_version=`pyenv install -l | egrep "^\s*\d.\d.\d$" | tail -n 1`
    `pyenv install ${py_new_version}`
    `pyenv global ${py_new_version}`
    `pip install --upgrade pip`
    `pip install neovim vim-vint`
fi

dot_files=`find . -name "_*" -maxdepth 1`
for dot_file in $dot_files;
do
    dot_file=`basename $dot_file`
    cmd="ln -sf  dotfiles/$dot_file ${HOME}/.${dot_file:1}"
    echo $cmd
    `$cmd`
done
