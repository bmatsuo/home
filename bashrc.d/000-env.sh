# $HOME/bin takes precedence over $HOME/local/bin
if [ -d "$HOME/local/bin" ]; then
    export PATH="$HOME/local/bin:$PATH"
fi
if [ -d "$HOME/bin" ]; then
    export PATH="$HOME/bin:$PATH"
fi
