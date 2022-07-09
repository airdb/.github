#!/bin/bash

function yino_usage() {
    echo "Usage: yino <command> [<args>]"
    echo
    echo "Command: " 
    echo -e "\treload" 
    echo
    echo -e "\tcheck"
    echo
    echo
    echo
    echo "YiNo Profile, https://github.com/YiNo/profile."
}

function yino_profile_reload() {
    echo "start reload bash config"
    source ~/.bash_profile
    echo "🍗 reload bash config commplete"
}

function yino_profile_check() {
    echo "🍦 check profile symbolic links"
    ls -al $HOME | grep lr | grep profile
}


# yino profile command
function yino() {
    case $1 in
        "reload")
            yino_profile_reload
            ;;
        "check")
            yino_profile_check
            ;;
        *)
            [ -n $1 ] && yino_profile_reload
            yino_usage
            ;;
    esac
}

function delete_local_merged_branches() {
  git branch --merged master | grep -v master | xargs git branch -d
}

function delete_remote_merged_branches() {
  git fetch origin
  git remote prune origin

  for BRANCH in `git branch -r --merged origin/master |\
                 egrep "^\s*origin/"                  |\
                 grep -v master                       |\
                 grep chrishunt                       |\
                 cut -d/ -f2-`
  do
    git push origin :$BRANCH
  done
}

function weekly_summary() {
  LAST_WEEK=$(date -v-7d +%m/%d)

  STATS=$(
    git log --since=1.week --oneline |
    tail -n 1                        |
    awk '{ print $1 }'               |
    xargs git diff --shortstat
  )

  FEATURES=$(
    git log --since=1.week --oneline |
    egrep "Merge (pull|branch) "
  )

  FEATURES_COUNT=$(
    echo "$FEATURES" |
    sed '/^\s*$/d'   |
    wc -l            |
    awk '{ print $1 }'
  )

  echo "Stats ($LAST_WEEK - Today)"
  echo "---------------------"
  echo "$STATS"
  echo
  echo "Features ($FEATURES_COUNT)"
  echo "-------------"
  echo "$FEATURES"
}

function sshinit() {
  sshpass -e ssh -q -l root "$@"
}

function scpinit() {
  sshpass -e scp  "$@"
}

function dateconvert() {
  if [ ! -n $1 ]; then
    date -d @"$1" +"%Y-%m-%d %H:%M:%S"
  else
    echo "Usage: dateconvert UNIXTIME"
  fi
}

# export tencent cloud secret.
function export_docker_env() {
   while read -r line; do
	if echo "$line" | grep -v "^#" | grep -q "="; then
        	export "$line"
	fi
   done < ~/.config/docker/env

   env | grep "TENCENTCLOUD"
}

function sec() {
    ((h=${1}/3600))
    ((m=(${1}%3600)/60))
    ((s=${1}%60))
    # printf "%02d:%02d:%02d\n" $h $m $s
    printf "%02dh %02dm %02ds\n" $h $m $s
}
