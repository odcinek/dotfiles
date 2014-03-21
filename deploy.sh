#!/usr/bin/env bash
set -e
set -o verbose

for path in .vimrc .vim .bashrc .tmux.conf .env .gitconfig; do
  echo $path;
  if [ ! -h ~/$path ]; then
    ln -vis ~/.dotfiles/$path ~/$path
  fi
done

rm -rf ~/.vim/bundle/vundle && git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle || true
curl https://raw.githubusercontent.com/Lokaltog/powerline-fonts/master/Inconsolata/Inconsolata%20for%20Powerline.otf > ~/.env/Inconsolata%20for%20Powerline.otf
vim +BundleInstall +qall
echo "Deploy done" 
