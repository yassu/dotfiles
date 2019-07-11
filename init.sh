#!/bin/sh

# install git-completion.bash
if [ -e "~/.git-completion.bash" ]; then
    cmd="curl https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.bash -o ~/.git-completion.bash"
    `$cmd`
fi

dot_files=`find . -name "_*" -maxdepth 1`
for dot_file in $dot_files;
do
    dot_file=`basename $dot_file`
    cmd="ln -sf  dotfiles/$dot_file `(cd ~ && pwd)`/.${dot_file:1}"
    echo $cmd
    `$cmd`
done
