# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

export PGDATA="/usr/local/var/postgres"
export PATH="/usr/local/bin:$PATH"
export EDITOR="vim"

# Platform detection
case `uname` in
    'Darwin')  PLATFORM='MacOSX';;
    'Linux')   PLATFORM='Linux';;
    'SunOS')   PLATFORM='Solaris';;
    'FreeBSD') PLATFORM='FreeBSD';;
esac

# Initialization
if [ -d "$HOME/.bashrc.d/" ]; then
    for s in `sort <(find $HOME/.bashrc.d/ | egrep '\.sh$' | egrep -v '(MacOSX|Linux|Solaris|FreeBSD)\.sh$' && find $HOME/.bashrc.d/ | egrep "$PLATFORM\\.sh\$") | uniq`; do
        source $s
    done
fi

# Initialization specific to the local machine
if [ -f "$HOME/.bashrc.local" ]; then
    source  "$HOME/.bashrc.local"
fi
