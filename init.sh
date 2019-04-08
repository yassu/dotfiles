#!/bin/sh

dot_files=`find . -name "_*" -maxdepth 1`
for dot_file in $dot_files;
do
    dot_file=`basename $dot_file`
    cmd="ln -sf  dotfiles/$dot_file `(cd ~ && pwd)`/.${dot_file:1}"
    echo $cmd
    `$cmd`
done
