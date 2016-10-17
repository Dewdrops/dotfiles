export EDITOR='vim -u ~/.vimrc_tiny'

export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

export PAGER=less

export TERM=xterm-256color

# export JAVA_HOME="/Library/Java/JavaVirtualMachines/jdk1.8.0_91.jdk"
# export CLASS_PATH=".:$JAVA_HOME/lib/dt.jar:$JAVA_HOME/lib/tools.jar:"
# export PATH="$JAVA_HOME/bin:$PATH"
export PATH="$(brew --prefix homebrew/php/php70)/bin:$PATH"
export PATH="$HOME/.composer/vendor/bin:$PATH"
export PATH="/usr/local/sbin:$PATH"

export PATH="$HOME/site/racket/bin:$PATH"

export PATH="$HOME/.cabal/bin:$PATH"

export GOPATH=$HOME/myBox/go
export PATH=$GOPATH/bin:$PATH

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

alias 'cpanm=cpanm --mirror http://mirrors.163.com/cpan/'
alias 'npm=npm --registry http://registry.cnpmjs.org'

alias aria2rpc='aria2c --conf-path=/Users/dewdrops/Documents/Configurations/aria2.conf -D'

alias vi='vim'      # so the shell complete system can work
alias vt='vim -u ~/.vimrc_tiny'
alias ll='ls -AtlF'
alias rr='rm -rf'

alias javac="javac -J-Dfile.encoding=utf8"

alias dstat='dstat -cdlmnpsy'

[[ -s $(brew --prefix)/etc/profile.d/autojump.sh ]] && . $(brew --prefix)/etc/profile.d/autojump.sh

# export PATH="$HOME/.pyenv/bin:$PATH"
# eval "$(pyenv init -)"
# eval "$(pyenv virtualenv-init -)"
alias p3i='pip3 install -i https://pypi.douban.com/simple/'

eval "$(rbenv init -)"

[[ -s $HOME/perl5/perlbrew/etc/bashrc ]] && source $HOME/perl5/perlbrew/etc/bashrc

function take() {
    mkdir -p $1
    cd $1
}

