ZSHRC_DIR=~/.zshrc.d
[ -L "$ZSHRC_DIR" ] && ZSHRC_DIR=$(readlink "$ZSHRC_DIR")
if [ -d "$ZSHRC_DIR" ]; then
    for script in $(find "$ZSHRC_DIR" -name '*.sh' | sort); do
        source "$script"
    done
fi
unset ZSHRC_DIR

# ZSHRC_LOCAL_DIR is not expected to be a symlink
ZSHRC_LOCAL_DIR=~/.zshrc.local.d
if [ -d "$ZSHRC_LOCAL_DIR" ]; then
    for script in $(find "$ZSHRC_DIR" -name '*.sh' | sort); do
        source "$script"
    done
fi
