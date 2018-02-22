export ZSH=/Users/wangchen/.oh-my-zsh

ZSH_THEME="robbyrussell"

plugins=(git tmux zsh-syntax-highlighting)

source $ZSH/oh-my-zsh.sh

source `brew --prefix`/etc/profile.d/z.sh

export EDITOR=vim
export VISUAL=vim
export ANSIBLE_SCP_IF_SSH=y
export PATH="$PATH:$HOME/Developer/GitHub/bones/bin"
export ANSIBLE_NOCOWS=1

# Format UTC timestamp to string, support both second and millisecond
strftime() {
    gdate -d @$(echo $1 |head -c 10) "+%Y-%m-%dT%H:%M:%SZ"
}
# UTC timstamp in second
now() {
    gdate +%s
}
# UTC timstamp in millisecond
nowms() {
    gdate +%s%N |head -c 13
}

bones-echo() {
    print -P "🎃 ::%F{red}$1%f"
}

bones-install-brew() {
    /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
}

bones-install-oh-my-zsh() {
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
}

bones-install-utils() {
    # GNU utils like date realpath telnet ...
    brew install wget coreutils inetutils
}
bones-install-git() {
    # Replace system git
    brew install git tig
}

bones-pyenv-install() {
    # Cache the archive manually from mirror
    v="$1"
    cache_dir="~/.pyenv/cache"
    fn="Python-$v.tar.xz"
    bones-echo "Install $v"
    if [ ! -f "$cache_dir/$fn" ]; then
        bones-echo "Caching from mirror $cache_dir/$fn"
        wget -P $cache_dir http://mirrors.sohu.com/python/$v/$fn
    else
        bones-echo "Using cached archive $cache_dir/$fn"
    fi
    pyenv install -s $v
}

bones-pyenv-find-lastest-dist() {
    v="$1"
    pyenv install -l |grep "^[ ]*$v\.[0-9]\+\.[0-9]\+$" |tail -1 |sed 's/ //g'
}

bones-install-py() {
    bones-echo "Install the lastest distributions for 2.x & 3.x ..."
    brew install pyenv pyenv-virtualenv
    mkdir -p ~/.pyenv/cache/
    v=$(bones-pyenv-find-lastest-dist 2)
    bones-pyenv-install $v
    pyenv virtualenv -f $v v2
    v=$(bones-pyenv-find-lastest-dist 3)
    bones-pyenv-install $v
    pyenv virtualenv -f $v v3
}

alias issh='ssh -F ~/.ssh/aliyun-ssh_config'
alias iscp='scp -F ~/.ssh/aliyun-ssh_config'
alias irsync='rsync -e "ssh -F $(readlink ~/.ssh/aliyun-ssh_config)"'
alias bigfile='sudo du -d 1 -mc |sort -k1 -n -r |less'
alias qenv='env |grep -i'
alias jump_over='cowsay "JUMPING ...";http_proxy=HTTP://127.0.0.1:8123'
# Git alias
alias gcr='git checkout release'
# NVM
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
# PYENV
if which pyenv > /dev/null; then eval "$(pyenv init -)"; fi
if which pyenv-virtualenv-init > /dev/null; then
    eval "$(pyenv virtualenv-init -)";
fi

