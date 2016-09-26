# .dotfile
# bash/bashrc.symlink

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'

PS1='[\u@\h \W]\$ '

export EDITOR="emc"
export BROWSER="firefox"
export DESKTOP_SESSION="i3"

export LC_ALL="en_US.UTF-8"
export LANG="en_US.UTF-8"
export LANGUAGE="en_US.UTF-8"

export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting
