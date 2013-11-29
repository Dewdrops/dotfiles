# Bash configuration of Dewdrops (v_v_4474@126.com)
# vim: sw=4 ts=4 sts=4 et tw=80 foldmarker={{{,}}} foldlevel=0 foldmethod=marker

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# history {{{

HISTFILE=~/.histfile
HISTSIZE=10000
SAVEHIST=10000
# don't put duplicate lines or lines starting with space in the history.
HISTCONTROL=ignoreboth
# append to the history file, don't overwrite it
shopt -s histappend

function bash_stats() {
    history | awk '{CMD[$2]++;count++;}END { for (a in CMD)print CMD[a] " " CMD[a]/count*100 "% " a; }' | grep -v "./" | column -c3 -s " " -t | sort -nr | nl | head -n20
}

# }}}

# directory settings {{{

alias ..='cd ..'
alias cd..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias cd/='cd /'

alias 1='cd -'

alias md='mkdir -p'
alias rd='rmdir'

function take() {
    mkdir -p $1
    cd $1
}

# }}}

# appearance {{{

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "$debian_chroot" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color) color_prompt=yes;;
esac

if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
    # We have color support; assume it's compliant with Ecma-48
    # (ISO/IEC-6429). (Lack of such support is extremely rare, and such
    # a case would tend to support setf rather than setaf.)
    color_prompt=yes
else
    color_prompt=
fi

if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
    xterm*|rxvt*)
        PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
        ;;
    *)
        ;;
esac

# }}}

# commandline edit {{{

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

shopt -s globstar

# enable programmable completion features
if [ -f /etc/bash_completion ] && ! shopt -oq posix; then
    . /etc/bash_completion
fi

# }}}

# aliases and exports for applications {{{

export CCL_DEFAULT_DIRECTORY='/home/dewdrops/site/ccl'

export JAVA_HOME="$HOME/site/jdk1.7.0_45"
export CLASS_PATH=".:$JAVA_HOME/lib/dt.jar:$JAVA_HOME/lib/tools.jar:"
export PATH="$JAVA_HOME/bin:$PATH"

export GOROOT="$HOME/site/go"
export GOPATH="$HOME/site/go-path"
export PATH="$PATH:$GOROOT/bin"

export PATH="$HOME/.cabal/bin:$PATH"

export LESS=-R

export GREP_OPTIONS='--color=auto'
export GREP_COLOR='1;32'

alias vzr='vim ~/.zshrc'
alias vvr='vim ~/.vimrc'
alias vmk='vim Makefile'
alias vrk='vim Rakefile'

# allows square brackts for rake task invocation
alias rake="nocorrect noglob rake"
alias srake='nocorrect noglob sudo rake'

alias ls='ls --color=auto'
alias ll='ls -AlF --color=auto'
alias la='ls -A --color=auto'

alias rr='rm -rf'

alias sdn='sudo shutdown -h now'

alias sgem='sudo gem install'
alias spip='sudo pip install'
alias scpm='sudo cpanm'
alias sapt='sudo apt-get install'

alias rb='R CMD BATCH'

alias dstat='dstat -cdlmnpsy'

alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

alias e='emacs'
alias ec='emacsclient'

# }}}

# misc {{{

export EDITOR=vim

export PAGER=less

# setopt extended_glob

function bu {
    mv $@ ~/.recycle
}

# load customized configuration
[ -f .bashrc.customized ] && source .bashrc.customized

# }}}
