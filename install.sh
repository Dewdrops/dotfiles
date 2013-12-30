#!/bin/sh

set +e

scriptdir=$(dirname $(readlink -e $0))

for f in .vimrc .vimrc_tiny .vimperator .vimperatorrc .bashrc .zshrc .gitconfig .wgetrc .inputrc
do
    CMD="rm -rf $HOME/$f"
    echo $CMD
    $CMD
    CMD="ln -s $scriptdir/$f $HOME/$f"
    echo $CMD
    $CMD
done
