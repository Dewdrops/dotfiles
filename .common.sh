export EDITOR='vim -u ~/.vimrc_tiny'

export PAGER=less

export TERM=xterm-256color

export CCL_DEFAULT_DIRECTORY='/home/dewdrops/site/ccl'

# export JAVA_HOME="/Library/Java/JavaVirtualMachines/jdk1.8.0_20.jdk"
# export CLASS_PATH=".:$JAVA_HOME/lib/dt.jar:$JAVA_HOME/lib/tools.jar:"
# export PATH="$JAVA_HOME/bin:$PATH"
export PATH="$HOME/Library/Haskell/bin:$PATH"

export GOROOT="$HOME/site/go"
export GOPATH="$HOME/site/go-path"
export PATH="$PATH:$GOROOT/bin:$GOPATH/bin"

export PATH="$HOME/.cabal/bin:$PATH"
export PATH="$HOME/.npm/bin:$PATH"
export PATH="$HOME/local/bin:$PATH"

export LESS=-R

export GREP_OPTIONS='--color=auto'
export GREP_COLOR='1;32'

alias ..='cd ..'
alias cd..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'
alias ......='cd ../../../../..'
alias .......='cd ../../../../../..'
alias ........='cd ../../../../../../..'
alias .........='cd ../../../../../../../..'
alias ..........='cd ../../../../../../../../..'

alias 1='cd -'

alias md='mkdir -p'
alias rd='rmdir'

alias vi='vim'      # so the shell complete system can work
alias vt='vim -u ~/.vimrc_tiny'
alias vbr='vim ~/.bashrc'
alias vzr='vim ~/.zshrc'
alias vvr='vim ~/.vimrc'
alias vmk='vim Makefile'
alias vrk='vim Rakefile'
alias vit='vim -u ~/.vimrc_tiny'
alias gvi='gvim'
alias gvit='gvim -u ~/.vimrc_tiny'
alias gvt='gvim -u ~/.vimrc_tiny'

alias ls='ls'
alias ll='ls -AtlF'
alias la='ls -At'

alias rr='rm -rf'

alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

alias sdn='sudo shutdown -h now'

alias sgem='sudo gem install'
alias spip='sudo pip install'
alias scpm='sudo cpanm'
alias sapt='sudo apt-get install'

alias rb='R CMD BATCH'

alias javac="javac -J-Dfile.encoding=utf8"

alias dstat='dstat -cdlmnpsy'

alias e='emacs'
alias ec='emacsclient'

[[ -s $HOME/.autojump/etc/profile.d/autojump.sh ]] && source $HOME/.autojump/etc/profile.d/autojump.sh &>null

function take() {
    mkdir -p $1
    cd $1
}

function bu {
    mv $@ ~/.recycle
}

function stats() {
    history | awk '{CMD[$2]++;count++;}END { for (a in CMD)print CMD[a] " " CMD[a]/count*100 "% " a; }' | grep -v "./" | column -c3 -s " " -t | sort -nr | nl | head -n20
}

