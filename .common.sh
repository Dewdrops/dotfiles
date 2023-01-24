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

export PATH=$GOPATH/bin:$PATH

export PATH=$HOME/bin:$PATH
export PATH=/usr/local/Cellar/opencv3/3.2.0/bin:$PATH

export LESS=-R

eval "$(/opt/homebrew/bin/brew shellenv)"

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
# source /Users/dewdrops/miniconda3/etc/profile.d/conda.sh
alias pipi='pip install -i https://pypi.douban.com/simple/'

#eval "$(rbenv init -)"

function take() {
    mkdir -p $1
    cd $1
}

alias hp='ALL_PROXY=socks5://localhost:18010'

export NODE_PATH="/usr/local/lib/node_modules"

BREW_PREFIX=$(brew --prefix)

export NVM_DIR="$HOME/.nvm"
[ -s "$BREW_PREFIX/opt/nvm/nvm.sh" ] && \. "/$BREW_PREFIX/opt/nvm/nvm.sh"  # This loads nvm

export PATH="$PATH:/Applications/bytedanceide.app/Contents/Resources/app.asar.unpacked"

alias wxcli="/Applications/wechatwebdevtools.app/Contents/MacOS/cli"

export PATH="$PATH:/usr/local/lib/ruby/gems/3.0.0/bin"
export PATH=/usr/local/smlnj/bin:"$PATH"
export PATH=/Users/dewdrops/.nimble/bin:$PATH

export PATH="$PATH:$HOME/.dotnet/tools"

export PATH="$PATH:$HOME/site/flutter/bin"

export PATH=/Applications/factor:"$PATH"

# eval `/usr/local/bin/opam config env`

export PUB_HOSTED_URL=https://pub.flutter-io.cn
export FLUTTER_STORAGE_BASE_URL=https://storage.flutter-io.cn

export PATH="$BREW_PREFIX/opt/ruby/bin:$PATH"

export PATH=$PATH:~/.roswell/bin

export CFLAGS="-I$BREW_PREFIX/include -L$BREW_PREFIX/lib"
export LDFLAGS="-L$BREW_PREFIX/lib/"

export PATH="/opt/homebrew/opt/texinfo/bin:$PATH"
export PATH=/Applications/factor:"$PATH"

if [ -d "/Applications/Emacs.app/Contents/MacOS/bin" ]; then
  export PATH="$PATH:/Applications/Emacs.app/Contents/MacOS/bin"
fi

vterm_printf(){
    if [ -n "$TMUX" ] && ([ "${TERM%%-*}" = "tmux" ] || [ "${TERM%%-*}" = "screen" ] ); then
        # Tell tmux to pass the escape sequences through
        printf "\ePtmux;\e\e]%s\007\e\\" "$1"
    elif [ "${TERM%%-*}" = "screen" ]; then
        # GNU screen (screen, screen-256color, screen-256color-bce)
        printf "\eP\e]%s\007\e\\" "$1"
    else
        printf "\e]%s\e\\" "$1"
    fi
}
export PATH="/opt/homebrew/opt/postgresql@15/bin:$PATH"
