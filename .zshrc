#! /usr/bin/env zsh

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# HISTFILE=~/.histfile

#load general exports, functions, and aliases
source $HOME/.common.sh

fpath=(/usr/local/share/zsh-completions $fpath)
export FPATH=$(brew --prefix)/share/zsh-completions:$FPATH
export FPATH=$(brew --prefix)/share/zsh/site-functions:$FPATH

alias cd/='cd /'

setopt auto_name_dirs
setopt cdable_vars
setopt pushdminus

setopt interactivecomments

setopt long_list_jobs

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

[[ -s $(brew --prefix)/etc/profile.d/autojump.sh ]] && . $(brew --prefix)/etc/profile.d/autojump.sh

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/dewdrops/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/dewdrops/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/dewdrops/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/dewdrops/google-cloud-sdk/completion.zsh.inc'; fi

source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/Users/czhou/miniconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/Users/czhou/miniconda3/etc/profile.d/conda.sh" ]; then
        . "/Users/czhou/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="/Users/czhou/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

[[ ! -r /Users/czhou/.opam/opam-init/init.zsh ]] || source /Users/czhou/.opam/opam-init/init.zsh  > /dev/null 2> /dev/null
