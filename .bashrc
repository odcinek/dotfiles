#!/usr/bin/env bash

if [ -f ~/.bash_local ]; then
  . ~/.bash_local
fi

[ -z "$PS1" ] && return

shopt -s checkwinsize
shopt -s hostcomplete
shopt -s histverify

if [ -a ~/local/bin/tmux ]; then
  alias tmux="~/local/bin/tmux attach"
else
  alias tmux="tmux"
fi

if [ -f /etc/bash_completion ] && ! shopt -oq posix; then
  . /etc/bash_completion
fi

if [ -f ~/.git-completion.bash ]; then
  . ~/.git-completion.bash
fi

HISTFILESIZE=1000000000
HISTSIZE=1000000
HISTCONTROL=ignoredups:ignorespace

export PATH=/usr/local/sbin:/usr/local/bin:/usr/local/share/python:~/.bin:/opt/chef/embedded/bin/:$PATH
export PATH=~/.bin:$PATH
export TERM="xterm-256color"
export PS1='\[\033[01;31m\]\u\[\033[00m\]@\[\033[01;34m\]\H\[\033[00m\]:\[\033[01;32m\]\w\[\033[00m\]\[\033[01;31m\]$\[\033[00m\] '
export VIRTUALENV_DISTRIBUTE=true
export PIP_VIRTUALENV_BASE=$HOME/.virtualenvs
export PIP_REQUIRE_VIRTUALENV=true
export PIP_DOWNLOAD_CACHE=$HOME/.pip/cache
export LANGUAGE="en_US.UTF-8"
export LANG="en_US.UTF-8"
export LC_ALL="en_US.UTF-8"
export GREP_COLOR='1;35;40'
export EDITOR=vim
export SVN_EDITOR=vim
export PAGER=most
export VISUAL=vim
export LESS_TERMCAP_so=$'\E[30;43m'
export MANPAGER=most

alias ls='ls -G --color'
alias ll='ls -alhF'
alias la='ls -A'
alias l="ls -alh"
alias rscp="rsync --progress --partial -avz -e ssh"
alias rscpr="rsync --remove-source-files --progress --partial -avz -e ssh"
alias sshp='ssh -o PreferredAuthentications=keyboard-interactive -o PubkeyAuthentication=no'
alias sudo='sudo -E'
alias vi='vim'
alias duh='du -sch .[!.]* * |sort -h'
alias nautilus="dolphin"
alias grep="grep --color"
alias xvfb-rspec='xvfb-run -a --server-args="-screen 0 1280x800x16" bundle exec rspec'
