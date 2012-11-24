Features
========

* inputrc

vi-style terminal (readline) input.

* bashrc

several variables and aliases for a uniform cross-platform experience.

* vimrc

A custom vimrc.

* matplotlibrc

make pretty figures with matplotlib.

* rvmrc

everything except an actually rvm installation.

Setup
=====

    ln -s /path/to/repo/home/config ~/.config

    ln -s /path/to/repo/home/bashrc.d ~/.bashrc.d
    ln -s /path/to/repo/home/bashrc ~/.bashrc

    ln -s /path/to/repo/home/inputrc ~/.inputrc

    ln -s /path/to/repo/home/tmux.conf ~/.tmux.conf

    ln -s /path/to/repo/home/gitconfig ~/.gitconfig

    git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
    ln -s /path/to/repo/home/vimrc ~/.vimrc

* rvm

See [rvm quick install](http://beginrescueend.com/)
