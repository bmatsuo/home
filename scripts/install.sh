#!/bin/bash

# files to link in the home directory
files=(
        config
        gitconfig
        tmux.conf
        vimrc
        inputrc
        bashrc
        bashrc.d
        zshrc
        zshrc.d
        pythonrc.py
        Xdefaults
      )

# hooks to call after linking
function post_hooks() {
    case $1 in
        vimrc)
            [ -d "$HOME/.vim/bundle/Vundle.vim" ] || git clone "https://github.com/VundleVim/Vundle.vim.git" "$HOME/.vim/bundle/Vundle.vim"
            ;;
    esac
}

for f in ${files[*]}; do
    src="`pwd`/$f"
    dest="$HOME/.$f"
    if [[ -L "$dest" ]] && [ "$src" = `readlink $dest` ]; then
        echo "link to source already exists; $f"
    elif [ -e "$dest" ]; then
        ACTION=""
        while [ -z "$ACTION" ]; do
            read -n1 -ep"$dest exists: [Brn] "
            case `echo $REPLY | tr [A-Z] [a-z]` in
                b)  ACTION="backup"     ;;
                r)  ACTION="replace"    ;;
                n)  ACTION="nothing"    ;;
                *)  if [ -z "$REPLY" ]
                    then ACTION="backup"
                    else echo "didn't understand $REPLY"
                    fi
                    ;;
            esac
        done

        case "$ACTION" in
            backup) mv "$dest" "$dest.backup.`date +"%Y-%m-%d"`" ;;
            replace) rm "$dest" ;;
        esac

        [ "$ACTION" = "nothing" ] || ln -s "$src" "$dest"
    else
        ln -s "$src" "$dest"
    fi
    post_hooks "$f"
done
