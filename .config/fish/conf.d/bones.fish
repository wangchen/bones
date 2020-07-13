# omf install https://github.com/jhillyerd/plugin-git
set -x JAVA_HOME (/usr/libexec/java_home -v 1.8)
set -x PATH $PATH "$HOME/Developer/GitHub/bones/bin"
set -x PATH $PATH "$HOME/Developer/opt/flutter/bin"

set -x EDITOR 'vim'

# fancy utils: https://zhuanlan.zhihu.com/p/54946696
abbr -a ls exa
abbr -a ll exa -al
# abbr -a find fd
# abbr -a grep rg
# abbr -a cat bat
set -x FZF_DEFAULT_OPTS '--height 60%'

abbr -a jump ssh -p 2222 wangchen@bastion.ab.ink

# GitHub
eval (hub alias -s)
# Git abbrs
abbr -a gpsup "git push --set-upstream origin (git rev-parse --abbrev-ref HEAD)"
abbr -a gcm git checkout master
abbr -a gcr git checkout release
abbr -a gcb git checkout -
abbr -a glr git pull --rebase

# Docker
abbr -a dcl docker container ls
abbr -a dcla docker container ls -a

# Java
abbr -a java-jar "java -jar (ls target/*.jar|head -1)"

# Python related
if test (which pyenv)
    status --is-interactive; and source (pyenv init -|psub)
    status --is-interactive; and source (pyenv virtualenv-init -|psub)
else
    brew install pyenv virtualenv
end

function py_pyenv_install --description 'Install python with taobao mirror'
    set v $argv[1]
    wget https://npm.taobao.org/mirrors/python/$v/Python-$v.tar.xz -P ~/.pyenv/cache/
    pyenv install $v
end

function py_setup_pip_mirror
    pip install pip -U

    pip config set global.index-url https://pypi.tuna.tsinghua.edu.cn/simple
end

function py_setup_dev_env
    pip install \
        python-language-server[all] \
        pyls-isort \
        pyls-mypy \
        pyls-black \
        yapf \
        importmagic \
        epc \
        ipython \
        ptvsd
end

