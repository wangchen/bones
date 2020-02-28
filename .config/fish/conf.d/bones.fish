set -x JAVA_HOME (/usr/libexec/java_home -v 1.8)
set -x PATH $PATH "$HOME/Developer/GitHub/bones/bin"
set -x PATH $PATH "$HOME/Developer/opt/flutter/bin"

set -x EDITOR 'emacsclient'

set -x FZF_DEFAULT_OPTS '--height 60% --preview "bat --style=numbers --color=always {} | head -500"'

eval (hub alias -s)

# fancy utils: https://zhuanlan.zhihu.com/p/54946696
abbr -a ls exa
abbr -a find fd
abbr -a grep rg

abbr -a issh ssh -F "$HOME/.ssh/aliyun-ssh_config"
abbr -a iscp scp -F "$HOME/.ssh/aliyun-ssh_config"

# Git abbrs
abbr -a gpsup "git push --set-upstream origin (git rev-parse --abbrev-ref HEAD)"
abbr -a gcm git checkout master
abbr -a gcr git checkout release
abbr -a gcb git checkout -
abbr -a glr git pull --rebase

# Java
abbr -a java-jar "java -jar (ls target/*.jar|head -1)"
