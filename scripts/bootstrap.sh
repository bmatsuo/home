#!/usr/bin/env bash

##
## usage:
##  bash scripts/bootstrap.sh
##  GITHUB_HOME_USE_HTTP=yes GITHUB_HOME_LOCAL="$HOME/path/to/local/repo" bash scripts/bootstrap.sh

GITHUB_HOME_REPO=bmatsuo/home.git
if [ -z "$GITHUB_HOME_USE_HTTP" ]; then
    GITHUB_HOME_URL="git@github.com:bmatsuo/home.git"
else
    GITHUB_HOME_URL="https://github.com/bmatsuo/home.git"
fi

echo 'bootstrap install of github.com/bmatsuo/home'

if [ -z `ssh-add -l` ]; then
    echo 'no ssh key is set up' 1>&2
    exit 1
fi

if [ -z "$GITHUB_HOME_LOCAL" ]; then
    GITHUB_HOME_LOCAL="$HOME/home"
fi
echo "cloning to $GITHUB_HOME_LOCAL"

git clone "$GITHUB_HOME_URL" "$GITHUB_HOME_LOCAL"
[ $? -eq 0 ] || exit 1

echo "installing files"
cd "$GITHUB_HOME_LOCAL" && bash scripts/install.sh
