#! /usr/bin/env zsh

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# HISTFILE=~/.histfile

#load general exports, functions, and aliases
source $HOME/.common.sh

alias cd/='cd /'

setopt auto_name_dirs
setopt cdable_vars
setopt pushdminus

setopt interactivecomments

setopt long_list_jobs

source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"

