# History settings [bash(1)]
HISTCONTROL=ignoreboth # ignore duplicate lines and lines staring with space.
shopt -s histappend    # append to the history file, don't overwrite it
HISTSIZE=1000          # number of history lines
HISTFILESIZE=2000      # maximum history filesize
