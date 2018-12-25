set -x JAVA_HOME (/usr/libexec/java_home -v 1.8)
set -x PATH $PATH "$HOME/Developer/GitHub/bones/bin"
set -x PATH $PATH "$HOME/Developer/App/flutter/bin"

set -x EDITOR 'emacsclient'
alias e="$EDITOR"

eval (hub alias -s)


abbr -a issh ssh -F "$HOME/.ssh/aliyun-ssh_config"
abbr -a iscp scp -F "$HOME/.ssh/aliyun-ssh_config"

# Git abbrs
abbr -a gpsup "git push --set-upstream origin (git rev-parse --abbrev-ref HEAD)"
abbr -a gcm git checkout master
abbr -a gcr git checkout release
abbr -a gcb git checkout -
abbr -a glr git pull --rebase
