#!/usr/bin/env bash

for path in .vimrc .vim .bashrc .tmux.conf .env .gitconfig; do
  echo $path;
  if [ ! -h ~/$path ]; then
    ln -vis ~/.dotfiles/$path ~/$path
  fi
done

rm -rf ~/.vim/bundle/vundle && git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle || true
wget https://github.com/Lokaltog/powerline-fonts/raw/master/Inconsolata/Inconsolata%20for%20Powerline.otf -O ~/.env/Inconsolata%20for%20Powerline.otf
vim +BundleInstall +qall
