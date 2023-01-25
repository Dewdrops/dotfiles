export EDITOR='vim -u ~/.vimrc_tiny'

export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

export PAGER=less
alias cd..='cd ..'
alias ..='cd ..'
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

alias vi='vim'      # so the shell complete system can work
alias vt='vim -u ~/.vimrc_tiny'

alias pipi='pip install -i https://pypi.douban.com/simple/'

function take() {
    mkdir -p $1
    cd $1
}

alias hp='ALL_PROXY=socks5://localhost:1086'

source /usr/share/nvm/init-nvm.sh

export PATH="$HOME/local/bin:$PATH"

eval $(opam env --switch=5.0.0)

source /opt/miniconda/etc/profile.d/conda.sh

export GCM_CREDENTIAL_STORE=cache
