#!/bin/bash

alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'
alias ssh='ssh -q'

alias ll="ls -l"

alias ipsort="sort -t"." -k1,1n  -k2,2n  -k3,3n  -k4,4n"
alias ipsortr="sort -t"." -k1,1nr -k2,2nr -k3,3nr -k4,4nr"


# User define

alias work="[ -d $HOME/go/src/github.com/airdb ] && cd $HOME/go/src/github.com/airdb"
alias github="[ -d $HOME/go/src/github.com ] && cd $HOME/go/src/github.com"
alias wiki="[ -d $HOME/go/src/github.com/airdb-wiki ] && cd $HOME/go/src/github.com/airdb-wiki"
#alias chrome='open -a "Google Chrome"'
alias trim_newline="truncate -s -1 "
alias icloud="cd ~/Library/Mobile\ Documents/com~apple~CloudDocs/"

# Wechat
alias mina_close="/Applications/wechatwebdevtools.app/Contents/MacOS/cli --close ~/go/src/github.com/bbhj/mina"
alias mina_open="/Applications/wechatwebdevtools.app/Contents/MacOS/cli --auto ~/go/src/github.com/bbhj/mina"

indentFormat="indent -kr -i2 -ts2 -nut -sob -l80 -ss -bs -bbb -bl -bli0 -nce -psl"

# tcpdump -i eth0 ether proto 0x88cc -A -s0 -t -c2 -v
# lldptool -t -n -i eth0  -V portID

# minio client
alias mc="mc --config-dir=$HOME/.config/mc"
