# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
fi

# color output of ls, grep, and derivatives
color_opt="--color=auto"
case "$PLATFORM" in
    Linux) ls_color_opt="$color_opt";;
    MacOSX) ls_color_opt="-G";;
esac
alias ls="ls $ls_color_opt"
#alias dir="dir $color_opt"
#alias vdir="vdir $color_opt"
alias grep="grep $color_opt"
alias fgrep="fgrep $color_opt"
alias egrep="egrep $color_opt"
env_unset="ls_color_opt:color_opt:$env_unset"

# some ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
