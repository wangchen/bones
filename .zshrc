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

bones-setup() {
    # GNU utils like date realpath telnet ...
    brew install coreutils inetutils
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

