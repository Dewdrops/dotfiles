# Bash configuration of Dewdrops (v_v_4474@126.com)
# vim: sw=4 ts=4 sts=4 et tw=80

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

#load general exports, functions, and aliases
source $HOME/.common.sh


HISTFILE=~/.histfile
HISTSIZE=10000
SAVEHIST=10000

# don't put duplicate lines or lines starting with space in the history.
HISTCONTROL=ignoreboth
# append to the history file, don't overwrite it
shopt -s histappend


if [ -f "/usr/local/opt/bash-git-prompt/share/gitprompt.sh" ]; then
    __GIT_PROMPT_DIR="/usr/local/opt/bash-git-prompt/share"
    GIT_PROMPT_FETCH_REMOTE_STATUS=0
    GIT_PROMPT_IGNORE_SUBMODULES=1
    GIT_PROMPT_THEME=Single_line
    source "/usr/local/opt/bash-git-prompt/share/gitprompt.sh"
fi

# enable programmable completion features
if [ -f /etc/bash_completion ] && ! shopt -oq posix; then
    . /etc/bash_completion
fi

[ -f ~/.fzf.bash ] && source ~/.fzf.bash

