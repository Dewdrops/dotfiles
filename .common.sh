export EDITOR='vim -u ~/.vimrc_tiny'

export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

export PAGER=less

export TERM=xterm-256color

export JAVA_HOME=`/usr/libexec/java_home`
export HADOOP_HOME=/usr/local/opt/hadoop/libexec

export PATH="$HOME/.composer/vendor/bin:$PATH"
export PATH="/usr/local/sbin:$PATH"
export PATH="/Applications/Julia-1.0.app/Contents/Resources/julia/bin:$PATH"

export PATH="$HOME/.cabal/bin:$PATH"
export PATH="$HOME/Library/Android/sdk/platform-tools:$PATH"

export GOPATH=$HOME/myBox/go
export PATH=$GOPATH/bin:$PATH

export PATH=$HOME/bin:$PATH
export PATH=/usr/local/Cellar/opencv3/3.2.0/bin:$PATH

export LESS=-R

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

# alias 'cpanm=cpanm --mirror http://mirrors.163.com/cpan/'
alias 'cnpm=npm --registry http://registry.cnpmjs.org'

alias aria2rpc='aria2c --conf-path=/Users/dewdrops/Documents/Configurations/aria2.conf -D'

alias vi='vim'      # so the shell complete system can work
alias vo='vim -R'      # so the shell complete system can work
alias vt='vim -u ~/.vimrc_tiny'
alias ll='ls -AtlFG'
alias ls='ls -G'
alias rr='rm -rf'

alias javac="javac -J-Dfile.encoding=utf8"

alias dstat='dstat -cdlmnpsy'

# export PATH="$HOME/.pyenv/bin:$PATH"
# eval "$(pyenv init -)"
# eval "$(pyenv virtualenv-init -)"
# VIRTUALENVWRAPPER_PYTHON=/usr/local/bin/python2.7
# source /usr/local/bin/virtualenvwrapper.sh
source /Users/dewdrops/miniconda3/etc/profile.d/conda.sh
alias pipi='pip install -i https://pypi.douban.com/simple/'

#eval "$(rbenv init -)"

#[[ -s $HOME/perl5/perlbrew/etc/bashrc ]] && source $HOME/perl5/perlbrew/etc/bashrc

function take() {
    mkdir -p $1
    cd $1
}

alias hp='all_proxy=localhost:8118'

# export PATH="/usr/local/opt/node@8/bin:$PATH"

export PATH="/usr/local/opt/php@7.4/bin:$PATH"
export PATH="/usr/local/opt/php@7.4/sbin:$PATH"

export PATH="$HOME/site/optipng-0.7.7/src/optipng:$PATH"

export NODE_PATH="/usr/local/lib/node_modules"

export NVM_DIR="$HOME/.nvm"
[ -s "/usr/local/opt/nvm/nvm.sh" ] && . "/usr/local/opt/nvm/nvm.sh"  # This loads nvm

export PATH="$PATH:/Applications/bytedanceide.app/Contents/Resources/app.asar.unpacked"

alias wxcli="/Applications/wechatwebdevtools.app/Contents/MacOS/cli"

export PATH="$PATH:/usr/local/lib/ruby/gems/3.0.0/bin"
export PATH=/usr/local/smlnj/bin:"$PATH"
export PATH=/Users/dewdrops/.nimble/bin:$PATH

export PATH="$PATH:$HOME/.dotnet/tools"

export PATH="$PATH:$HOME/site/flutter/bin"

export PATH=/Applications/factor:"$PATH"

[ -f "/Users/dewdrops/.ghcup/env" ] && source "/Users/dewdrops/.ghcup/env" # ghcup-env

eval `/usr/local/bin/opam config env`

export PUB_HOSTED_URL=https://pub.flutter-io.cn
export FLUTTER_STORAGE_BASE_URL=https://storage.flutter-io.cn

