#!/bin/bash

for setup_script in ~/.bash/bash_*; do . $setup_script; done
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
