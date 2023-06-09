#!/usr/bin/env bash

set -E -e -u -o pipefail
filename=".rsync"
echo $filename
if [[ ! -f $filename ]]; then
	echo "put rsync on the project home"
  echo "-----------------------------"
  echo "martins3@192.168.11.1:~/"
  echo "-----------------------------"
	exit 1
fi
set -x
# if [[ $(head -n 2 $filename) != "copied" ]];then
#   ssh-copy-id
# fi
rsync -avzh --delete --filter="dir-merge,- .gitignore" "$(pwd)/" "$(head -n 1 $filename)"/