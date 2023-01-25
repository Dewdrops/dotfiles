#!/bin/sh

set +e

scriptdir=$(pwd)

for f in .ideavimrc .vimrc .vimrc_tiny .bashrc .zshrc .common.sh .gitconfig .gitexcludes .wgetrc .inputrc .irbrc .zpreztorc
do
    CMD="rm -rf $HOME/$f"
    echo $CMD
    $CMD
    CMD="ln -s $scriptdir/$f $HOME/$f"
    echo $CMD
    $CMD
done

