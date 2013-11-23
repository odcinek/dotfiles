[ -z "$PS1" ] && return

shopt -s checkwinsize
shopt -s hostcomplete
shopt -s histverify

HISTFILESIZE=1000000000
HISTSIZE=1000000
HISTCONTROL=ignoredups:ignorespace

#export TERM=screen-256color       # for a tmux -2 session (also for screen)
export PATH=/usr/local/sbin:/usr/local/bin:/usr/local/share/python:~/.bin:$PATH
export PATH=$PATH:$HOME/.rvm/bin
export PATH="/usr/local/heroku/bin:$PATH"
eval `gdircolors ~/.env/dircolors.ansi-universal`
#eval `gdircolors ~/.env/dircolors.256dark`
export PS1='\[\033[01;31m\]\u\[\033[00m\]@\[\033[01;34m\]\H\[\033[00m\]:[\#]:\[\033[01;32m\]\w\[\033[00m\]\n\[\033[01;31m\]#\[\033[00m\] '

alias ls='gls -G --color'
alias ll='ls -alhF'
alias la='ls -A'
alias v="vi"
alias l="ls -alh"
alias c="cd"
alias m="make"
alias rscp="rsync --progress --partial -avz -e ssh"
alias vlc='/Applications/VLC.app/Contents/MacOS/VLC -I rc'
alias grep='ggrep'
alias chrome='~/.bin/chrome'
alias sshp='ssh -o PreferredAuthentications=keyboard-interactive -o PubkeyAuthentication=no'

if [ -f /etc/bash_completion ] && ! shopt -oq posix; then
    . /etc/bash_completion
fi
if [ -f `brew --prefix`/etc/bash_completion ]; then
    . `brew --prefix`/etc/bash_completion
fi

export VIRTUALENV_DISTRIBUTE=true
export PIP_VIRTUALENV_BASE=$HOME/.virtualenvs
export PIP_REQUIRE_VIRTUALENV=true
export PIP_DOWNLOAD_CACHE=$HOME/.pip/cache
export LANGUAGE="en_US.UTF-8"
export LANG="en_US.UTF-8"
export LC_ALL="en_US.UTF-8"
export JAVA_HOME=$(/usr/libexec/java_home -v 1.7)
export GREP_OPTIONS='--color=auto'
export GREP_COLOR='1;35;40'
export EDITOR=vim
export SVN_EDITOR=vim
export PAGER=less
export VISUAL=vim

alias fetch="rsync --progress --partial -avz -e ssh --remove-source-files root@171.25.182.36:~/downloads/* ~/Series/"
