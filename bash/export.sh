#!/bin/bash

export LC_NAME=$USER
#export PS1='[\033[32mworkdir: \w \033[0m]\n'$PS1
#export PS1='===workdir: \w ===\n'$PS1
export LANG=en_US.UTF-8
export HISTTIMEFORMAT="%F %T `whoami` "
export LIBRARY_PATH=$LIBRARY_PATH:/usr/local

export TF_CPP_MIN_LOG_LEVEL=2
export PATH=$PATH:$HOME/go/bin/

## suport aliyun cloud shell.
## https://shell.aliyun.com
if [ $LOGNAME == "shell" ]; then
  # export PS1="[\[\033[01;32m\]dean@relay.airdb.com\[\033[00m\]relay.airdb.com \[\033[01;34m\]\W\[\033[00m\]\$] "
  export PS1="[\[\033[01;32m\]dean\[\033[00m\]@relay.airdb.host \W]\$ "
fi



# Setup Ubuntu default editor.
export EDITOR=vim

# macOS Catalina
export BASH_SILENCE_DEPRECATION_WARNING=1
SHELL_SESSION_HISTORY=0

# User define
#export PS1="\[\e[35;1m\][\u@\h \W]$ \[\e[0m\]"
#export PYTHONSTARTUP=~/.pythonstartup
#export PS1="[\u@\h \W]\$ "

#export GOPATH=$(go env GOPATH)

# Docker
# Default platform for commands that take the --platform flag.
export DOCKER_DEFAULT_PLATFORM="linux/amd64"
