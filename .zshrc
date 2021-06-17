#! /usr/bin/env zsh

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

export ZPLUG_HOME=/usr/local/opt/zplug
source $ZPLUG_HOME/init.zsh

zplug "lib/completion", from:oh-my-zsh
zplug "lib/compfix", from:oh-my-zsh

zplug "lib/spectrum", from:oh-my-zsh

HISTFILE=~/.histfile
zplug "lib/history", from:oh-my-zsh

zplug "plugins/git", from:oh-my-zsh
zplug "plugins/pip", from:oh-my-zsh
zplug "plugins/command-not-found", from:oh-my-zsh

zplug "docker/cli", use:"contrib/completion/zsh"

zplug "zsh-users/zsh-syntax-highlighting"

# zplug "bhilburn/powerlevel9k", as:theme
# if zplug check bhilburn/powerlevel9k; then
#     POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(context dir virtualenv vcs)
#     POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status root_indicator background_jobs time)
#     POWERLEVEL9K_DIR_HOME_BACKGROUND='039'
#     POWERLEVEL9K_DIR_HOME_SUBFOLDER_BACKGROUND='039'
#     POWERLEVEL9K_DIR_DEFAULT_BACKGROUND='039'
# fi

# zplug "denysdovhan/spaceship-prompt", as:theme
# if zplug check denysdovhan/spaceship-prompt; then
#     SPACESHIP_EXIT_CODE_SHOW=true
#     SPACESHIP_TIME_SHOW=true
#     SPACESHIP_DIR_TRUNC=0
# fi

zplug mafredri/zsh-async
zplug sindresorhus/pure, use:pure.zsh, as:theme

# zplug "aaronjamesyoung/aaron-zsh-theme", as:theme

zplug load


#load general exports, functions, and aliases
source $HOME/.common.sh

fpath=(/usr/local/share/zsh-completions $fpath)

alias cd/='cd /'

alias 2='cd -2'
alias 3='cd -3'
alias 4='cd -4'
alias 5='cd -5'
alias 6='cd -6'
alias 7='cd -7'
alias 8='cd -8'
alias 9='cd -9'

setopt auto_name_dirs
setopt auto_cd
setopt cdable_vars
setopt auto_pushd
setopt pushd_ignore_dups
setopt pushdminus

setopt interactivecomments

setopt multios

setopt long_list_jobs

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

[[ -s $(brew --prefix)/etc/profile.d/autojump.sh ]] && . $(brew --prefix)/etc/profile.d/autojump.sh

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/dewdrops/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/dewdrops/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/dewdrops/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/dewdrops/google-cloud-sdk/completion.zsh.inc'; fi

FPATH=$(brew --prefix)/share/zsh-completions:$FPATH
autoload -Uz compinit
compinit
