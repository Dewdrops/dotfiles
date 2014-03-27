#! /usr/bin/env zsh
# Zsh configuration of Dewdrops (v_v_4474@126.com)
# vim: sw=4 ts=4 sts=4 et tw=80 foldmarker={{{,}}} foldlevel=0 foldmethod=marker

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

#load general exports, functions, and aliases
source $HOME/.common.sh

# history {{{

HISTFILE=~/.histfile
HISTSIZE=10000
SAVEHIST=10000

setopt append_history
setopt inc_append_history

setopt extended_history

setopt hist_expire_dups_first
setopt hist_ignore_dups
setopt hist_ignore_space

setopt hist_verify

# share command history data
setopt share_history

# }}}

# directory settings {{{

setopt auto_name_dirs
setopt auto_cd
setopt cdable_vars
setopt auto_pushd
setopt pushd_ignore_dups
setopt pushdminus

# }}}

# prompt {{{

autoload colors
colors

for color in RED GREEN YELLOW BLUE MAGENTA CYAN WHITE; do
    eval _$color='%{$terminfo[bold]$fg[${(L)color}]%}'
    eval $color='%{$fg[${(L)color}]%}'
    (( count = $count + 1 ))
done
FINISH="%{$terminfo[sgr0]%}"

setopt prompt_subst

function prompt_vc {
    git branch >/dev/null 2>/dev/null && git_prompt_info && return
    hg root >/dev/null 2>/dev/null && echo '☿' && return
    echo '>'
}

function git_prompt_info() {
    ref=$(command git symbolic-ref HEAD 2> /dev/null) || \
        ref=$(command git rev-parse --short HEAD 2> /dev/null) || return
    echo "± Git(${ref#refs/heads/}$(parse_git_dirty))"
}

parse_git_dirty() {
    local SUBMODULE_SYNTAX=''
    local GIT_STATUS=''
    if [[ "$(command git config --get oh-my-zsh.hide-status)" != "1" ]]; then
        SUBMODULE_SYNTAX="--ignore-submodules=dirty"
        if [[ "$DISABLE_UNTRACKED_FILES_DIRTY" == "true" ]]; then
            GIT_STATUS=$(command git status -s ${SUBMODULE_SYNTAX} -uno 2> /dev/null | tail -n1)
        else
            GIT_STATUS=$(command git status -s ${SUBMODULE_SYNTAX} 2> /dev/null | tail -n1)
        fi
        if [[ -n $GIT_STATUS ]]; then
            echo "*"
        fi
    else
        echo "$ZSH_THEME_GIT_PROMPT_CLEAN"
    fi
}

# MUST use single quote here. so interpolation can be eval each time RET is pressed
PROMPT='$CYAN\$ $GREEN%~$_MAGENTA $(prompt_vc)$FINISH '
RPROMPT="$RED%D %T$FINISH"

# }}}

# cmdline edit {{{

bindkey -e

WORDCHARS=''

autoload -U edit-command-line
zle -N edit-command-line

setopt interactive_comments

bindkey "^[m" copy-prev-shell-word

bindkey '\C-x\C-e' edit-command-line

# }}}

# completion {{{

autoload -Uz compinit
compinit

# use /etc/hosts and known_hosts for hostname completion
[ -r /etc/ssh/ssh_known_hosts ] && _global_ssh_hosts=(${${${${(f)"$(</etc/ssh/ssh_known_hosts)"}:#[\|]*}%%\ *}%%,*}) || _global_ssh_hosts=()
[ -r ~/.ssh/known_hosts ] && _ssh_hosts=(${${${${(f)"$(<$HOME/.ssh/known_hosts)"}:#[\|]*}%%\ *}%%,*}) || _ssh_hosts=()
[ -r ~/.ssh/config ] && _ssh_config=($(cat ~/.ssh/config | sed -ne 's/Host[=\t ]//p')) || _ssh_config=()
[ -r /etc/hosts ] && : ${(A)_etc_hosts:=${(s: :)${(ps:\t:)${${(f)~~"$(</etc/hosts)"}%%\#*}##[:blank:]#[^[:blank:]]#}} } || _etc_hosts=()
hosts=(
  "$_ssh_config[@]"
  "$_global_ssh_hosts[@]"
  "$_ssh_hosts[@]"
  "$_etc_hosts[@]"
  "$HOST"
  localhost
)
zstyle ':completion:*:hosts' hosts $hosts
zstyle ':completion:*' users off

# Use caching so that commands like apt and dpkg complete are useable
zstyle ':completion::complete:*' use-cache 1
zstyle ':completion::complete:*' cache-path $ZSH/cache/

# Don't complete uninteresting users
zstyle ':completion:*:*:*:users' ignored-patterns \
        adm amanda apache avahi beaglidx bin cacti canna clamav daemon \
        dbus distcache dovecot fax ftp games gdm gkrellmd gopher \
        hacluster haldaemon halt hsqldb ident junkbust ldap lp mail \
        mailman mailnull mldonkey mysql nagios \
        named netdump news nfsnobody nobody nscd ntp nut nx openvpn \
        operator pcap postfix postgres privoxy pulse pvm quagga radvd \
        rpc rpcuser rpm shutdown squid sshd sync uucp vcsa xfs

# ... unless we really want to.
zstyle '*' single-ignored show

zmodload -i zsh/complist

## case-insensitive (all),partial-word and then substring completion
if [ "x$CASE_SENSITIVE" = "xtrue" ]; then
  zstyle ':completion:*' matcher-list 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'
  unset CASE_SENSITIVE
else
  zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'
fi

zstyle ':completion:*' list-colors ''

zstyle ':completion:*:*:*:*:*' menu select
zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#) ([0-9a-z-]#)*=01;34=0=01'
zstyle ':completion:*:*:*:*:processes' command "ps -u `whoami` -o pid,user,comm -w -w"

# disable named-directories autocompletion
zstyle ':completion:*:cd:*' tag-order local-directories directory-stack path-directories
cdpath=(.)

# for rake tasks
_rake () {
    compadd $(rake --silent --tasks -A | cut -d " " -f 2)
}
compdef _rake rake

if [ -f ~/.auto-fu.zsh/auto-fu.zsh ]; then
    if [ -f ~/.auto-fu.zsh/auto-fu ]; then
        source ~/.auto-fu.zsh/auto-fu
        auto-fu-install;
    else
        source ~/.auto-fu.zsh/auto-fu.zsh
    fi

    zle-line-init () { auto-fu-init }
    zle -N zle-line-init
    zle -N zle-keymap-select auto-fu-zle-keymap-select
    zstyle ':completion:*' completer _oldlist _complete
    zstyle ':auto-fu:var' autoable-function/skipwords \
                "('|$'|\")*"
    zstyle ':auto-fu:var' autoable-function/skiplines \
                '[![:blank:]]# apt-get [![:blank:]]# *' \
                'sapt *' 'j[co] *' 'j *' 'jco *' 'scp *'
    zstyle ':auto-fu:highlight' input bold
    zstyle ':auto-fu:highlight' completion fg=black,bold
    zstyle ':auto-fu:highlight' completion/one fg=white,bold,underline
    zstyle ':auto-fu:var' postdisplay $''
    zstyle ':auto-fu:var' track-keymap-skip opp
else
    unsetopt menu_complete   # do not autoselect the first completion entry
    unsetopt flowcontrol
    setopt auto_menu         # show completion menu on succesive tab press
    setopt complete_in_word
    setopt always_to_end

    # should this be in keybindings?
    bindkey -M menuselect '^o' accept-and-infer-next-history

    if [ "x$COMPLETION_WAITING_DOTS" = "xtrue" ]; then
      expand-or-complete-with-dots() {
        echo -n "\e[31m......\e[0m"
        zle expand-or-complete
        zle redisplay
      }
      zle -N expand-or-complete-with-dots
      bindkey "^I" expand-or-complete-with-dots
    fi

    TOKENS_FOLLOWED_BY_COMMANDS=('|' '||' ';' '&' '&&' 'sudo' 'do' 'time' 'strace')
    recolor-cmd() {
        region_highlight=()
        colorize=true
        start_pos=0
        for arg in ${(z)BUFFER}; do
            ((start_pos+=${#BUFFER[$start_pos+1,-1]}-${#${BUFFER[$start_pos+1,-1]## #}}))
            ((end_pos=$start_pos+${#arg}))
            if $colorize; then
                colorize=false
                res=$(LC_ALL=C builtin type $arg 2>/dev/null)
                case $res in
                    *'sudo'*)           style="fg=red,bold";;
                    *'reserved word'*)  style="fg=magenta,bold";;
                    *'alias for'*)      style="fg=cyan,bold";;
                    *'shell builtin'*)  style="fg=yellow,bold";;
                    *'shell function'*) style='fg=green,bold';;
                    *"$arg is"*)        style="fg=blue,bold";;
                    *)                  style='none,bold';;
                esac
                region_highlight+=("$start_pos $end_pos $style")
            fi
            [[ ${${TOKENS_FOLLOWED_BY_COMMANDS[(r)${arg//|/\|}]}:+yes} = 'yes' ]] && colorize=true
            start_pos=$end_pos
        done
    }

    check-cmd-self-insert() { zle .self-insert && recolor-cmd }
    check-cmd-backward-delete-char() { zle .backward-delete-char && recolor-cmd }

    zle -N self-insert check-cmd-self-insert
    zle -N backward-delete-char check-cmd-backward-delete-char
fi

# }}}

# spectrum_ls {{{

typeset -Ag FX FG BG

FX=(
    reset     "%{[00m%}"
    bold      "%{[01m%}" no-bold      "%{[22m%}"
    italic    "%{[03m%}" no-italic    "%{[23m%}"
    underline "%{[04m%}" no-underline "%{[24m%}"
    blink     "%{[05m%}" no-blink     "%{[25m%}"
    reverse   "%{[07m%}" no-reverse   "%{[27m%}"
)

for color in {000..255}; do
    FG[$color]="%{[38;5;${color}m%}"
    BG[$color]="%{[48;5;${color}m%}"
done

# Show all 256 colors with color number
function spectrum_ls() {
  for code in {000..255}; do
    print -P -- "$code: %F{$code}Test%f"
  done
}

# }}}

# zsh specific aliases {{{

alias cd/='cd /'

alias 2='cd -2'
alias 3='cd -3'
alias 4='cd -4'
alias 5='cd -5'
alias 6='cd -6'
alias 7='cd -7'
alias 8='cd -8'
alias 9='cd -9'

# allows square brackts for rake task invocation
alias rake="nocorrect noglob rake"
alias srake='nocorrect noglob sudo rake'

alias -s html=firefox
alias -s js=vi
alias -s c=vi
alias -s cpp=vi
alias -s java=vi
alias -s txt=vi
alias -s gz='tar -xzvf'
alias -s tgz='tar -xzvf'
alias -s zip='unzip'
alias -s bz2='tar -xjvf'

# }}}

# misc {{{

setopt multios

setopt long_list_jobs

# setopt extended_glob

# Ubuntu's "command not found"
if [[ -f /etc/zsh_command_not_found  ]]; then
    source /etc/zsh_command_not_found
fi

# load customized configuration
[ -f $HOME/.zshrc.customized ] && source $HOME/.zshrc.customized

# }}}
