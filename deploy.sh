#!/usr/bin/env bash
set -e 
set -o verbose
ln -vis ~/.dotfiles/.vimrc ~/.vimrc
ln -vis ~/.dotfiles/.vim ~/.vim
ln -vis ~/.dotfiles/.bashrc ~/.bashrc
ln -vis ~/.dotfiles/.tmux.conf ~/.tmux.conf
ln -vis ~/.dotfiles/.env ~/.env
