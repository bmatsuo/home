# enable brew-installed bash completion packages
if which brew > /dev/null 2>&1 && [ -f "$(brew --prefix)/etc/bash_completion" ]; then
    . "$(brew --prefix)/etc/bash_completion"
fi
