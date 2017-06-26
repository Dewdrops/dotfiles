set -U fish_user_paths (brew --prefix homebrew/php/php70)/bin $HOME/.composer/vendor/bin $HOME/site/racket/bin /usr/local/sbin $fish_user_paths

set -x EDITOR 'vim -u ~/.vimrc_tiny'

set -x LC_ALL en_US.UTF-8
set -x LANG en_US.UTF-8

set -x PAGER less

set -x GREP_OPTIONS '--color=auto'
set -x GREP_COLOR '1;32'

set -x fish_prompt_pwd_dir_length 0

status --is-interactive; and . (rbenv init - | psub)

[ -f /Users/dewdrops/perl5/perlbrew/etc/perlbrew.fish ]; and source /Users/dewdrops/perl5/perlbrew/etc/perlbrew.fish

[ -f /usr/local/share/autojump/autojump.fish ]; and source /usr/local/share/autojump/autojump.fish

eval (thefuck --alias | tr '\n' ';')

function take
    mkdir -p $argv; and cd $argv
end

alias p3i "pip3 install -i https://pypi.douban.com/simple/"
alias cpanm "cpanm --mirror http://mirrors.163.com/cpan/"
alias npm "npm --registry http://registry.cnpmjs.org"
alias rr "rm -rf"
alias vt "vim -u ~/.vimrc_tiny"
alias aria2rpc "aria2c --conf-path=/Users/dewdrops/Documents/Configurations/aria2.conf -D"
