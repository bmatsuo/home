# Command History
setopt HIST_IGNORE_SPACE
setopt APPEND_HISTORY
HISTFILE=~/.zsh/histfile
HISTSIZE=1000
SAVEHIST=10000

# Misc Options
setopt EXTENDED_GLOB
unsetopt beep

if [ -t 1 ] || [ -t 2 ]; then
    export CLICOLOR=1
fi


# VI Mode
if [ -t 0 ] && [ -t 1 ]; then
    bindkey -v
    bindkey '\e' vi-cmd-mode

    # speed up vi mode transitions
    export KEYTIMEOUT=1

    function set-rps() {
        RPS1="${${KEYMAP/vicmd/-- NORMAL --}/(main|viins)/-- INSERT --}"
        RPS2=$RPS1
    }

    function zle-line-init zle-keymap-select {
        set-rps
        zle reset-prompt
    }

    setopt TRANSIENT_RPROMPT

    zle -N zle-line-init
    zle -N zle-keymap-select
    set-rps
fi

# Completion
if [ -t 0 ]; then
    autoload -Uz compinit && compinit

    # Disable completion menu to mash tab, also consider 'select' with vi
    # bindings
    zstyle ':completion:*' menu no
    #zstyle ':completion:*' menu select
    #bindkey -M menuselect 'h' vi-backward-char
    #bindkey -M menuselect 'k' vi-up-line-or-history
    #bindkey -M menuselect 'l' vi-forward-char
    #bindkey -M menuselect 'j' vi-down-line-or-history
fi
