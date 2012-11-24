# Lines configured by zsh-newuser-install
HISTFILE=~/.zsh/histfile
HISTSIZE=1000
SAVEHIST=10000
setopt autocd extendedglob
unsetopt appendhistory beep
bindkey -v
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/bryan/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall
