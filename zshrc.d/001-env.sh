# MacOS Homebrew
if [ -e "/opt/homebrew/bin/brew" ]; then
    eval "$(/opt/homebrew/bin/brew shellenv)"
fi

# $HOME/bin takes precedence over $HOME/local/bin when both are present.
if [ -d "$HOME/local/bin" ]; then
    export PATH="$HOME/local/bin:$PATH"
fi
if [ -d "$HOME/bin" ]; then
    export PATH="$HOME/bin:$PATH"
fi
