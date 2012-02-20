#!/bin/bash

. ~/.bash/bash_vars
for setup_script in ~/.bash/bash_*; do
    if [ "$setup_script" != ~/.bash/bash_vars ]; then
        . $setup_script;
    fi
done
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
