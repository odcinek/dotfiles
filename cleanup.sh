#!/usr/bin/env bash
#set -o verbose

for path in .vimrc .vim .bashrc .tmux.conf .env .gitconfig; do
  echo $path
  #rm -rf ~/$path && true
  unlink ~/$path &> /dev/null && true
done
