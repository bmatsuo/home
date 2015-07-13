#!/bin/bash

export PYTHONPATH="/usr/local/lib/python2.7/site-packages:$PYTHONPATH"

# eval the contents of ~/.pythonrc.py when the python interactive interpreter
# starts.
export PYTHONSTARTUP="$HOME/.pythonrc.py"
