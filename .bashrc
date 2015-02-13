#!/usr/bin/env bash

# FB specific
if [ -f ~/.bash_local ]; then
  . ~/.bash_local
fi

[ -z "$PS1" ] && return

shopt -s checkwinsize
shopt -s hostcomplete
shopt -s histverify

HISTFILESIZE=1000000000
HISTSIZE=1000000
HISTCONTROL=ignoredups:ignorespace

if [ -f /usr/local/bin/brew ]; then 
  # OSX
  eval `gdircolors ~/.env/dircolors.ansi-universal`
  alias grep='ggrep'
  alias ls='gls -G --color'
  alias vlc='/Applications/VLC.app/Contents/MacOS/VLC -I rc'
  alias chrome='~/.bin/chrome'
  if [ -f `brew --prefix`/etc/bash_completion ]; then
    . `brew --prefix`/etc/bash_completion
  fi
  if [ -f /usr/libexec/java_home ]; then
    if [ "$(/usr/libexec/java_home -v 1.7 &> /dev/null)" = 0 ]; then
      export JAVA_HOME=$(/usr/libexec/java_home -v 1.7)
    else
      export JAVA_HOME=$(/usr/libexec/java_home)
    fi
  fi
  stty -ixon
else
  alias ls='ls -G --color'
fi

TERM=screen-256color
export PATH=/usr/local/sbin:/usr/local/bin:/usr/local/share/python:~/.bin:/opt/chef/embedded/bin/:$PATH
export PATH=$PATH:$HOME/.rvm/bin
export PATH="~/bin:$PATH"
export PATH="/usr/local/heroku/bin:$PATH"
export PATH="/usr/local/opt/coreutils/libexec/gnubin:$PATH"
export PS1='\[\033[01;31m\]\u\[\033[00m\]@\[\033[01;34m\]\H\[\033[00m\]:[\#]:\[\033[01;32m\]\w\[\033[00m\]\n\[\033[01;31m\]#\[\033[00m\] '

alias ll='ls -alhF'
alias la='ls -A'
alias v="vi"
alias l="ls -alh"
alias rscp="rsync --progress --partial -avz -e ssh"
alias rscpr="rsync --remove-source-files --progress --partial -avz -e ssh"
kodi() {
    /usr/local/Cellar/rsync/3.1.1/bin/rsync --remove-source-files --protect-args --progress --partial -avz -e ssh --rsync-path=/storage/.kodi/addons/network.backup.rsync/bin/rsync $1 "root@kodi:$2"
}
alias sshp='ssh -o PreferredAuthentications=keyboard-interactive -o PubkeyAuthentication=no'
alias ack=~/.bin/ack

if [ -a ~/local/bin/tmux ]; then
   alias tmux="~/local/bin/tmux attach"
else
  alias tmux="tmux attach"
fi

if [ -f /etc/bash_completion ] && ! shopt -oq posix; then
  . /etc/bash_completion
fi

if [ -f ~/.git-completion.bash ]; then
  . ~/.git-completion.bash
fi

export VIRTUALENV_DISTRIBUTE=true
export PIP_VIRTUALENV_BASE=$HOME/.virtualenvs
export PIP_REQUIRE_VIRTUALENV=true
export PIP_DOWNLOAD_CACHE=$HOME/.pip/cache
export LANGUAGE="en_US.UTF-8"
export LANG="en_US.UTF-8"
export LC_ALL="en_US.UTF-8"
export GREP_OPTIONS='--color=auto'
export GREP_COLOR='1;35;40'
export EDITOR=vim
export SVN_EDITOR=vim
export PAGER=less
export VISUAL=vim

alias iex='rlwrap -a dummy iex'
alias sudo='sudo -E'
alias vi='vim'
alias duh='du -sch .[!.]* * |sort -h'
alias tunnel='autossh -M 0 -q -N -o "ControlMaster no" -o "ServerAliveInterval 3" -o "ServerAliveCountMax 3" -D 8080 root@tleilax.pl -v'
