#!/bin/bash

items=(
    .zshrc
    .vimrc
    .tmux.conf
)

realpath() {
    [[ $1 = /* ]] && echo "$1" || echo "$PWD/${1#./}"
}

basedir="$PWD/${0%/*}"

for item in ${items[@]}; do
    ln -sf $basedir/$item ~
done
