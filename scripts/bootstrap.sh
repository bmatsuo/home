#!/usr/bin/env bash

if [ -z `ssh-add -l` ]; then
    echo 'no ssh key is set up' 1>&2
    exit 1
fi

if [ -z GITHUB_HOME ]; then
    GITHUB_HOME=~/home
fi

git clone git@github.com:bmatsuo/home.git "$GITHUB_HOME"
[ $? -eq 0 ] || exit 1

cd "$GITHUB_HOME" && bash scripts/install.sh ${[@]}
