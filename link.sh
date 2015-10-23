#!/bin/bash

today="$(date '+%y-%m-%d')"
files=( vimrc bash_profile tmux.conf )

for f in "${files[@]}"; do 
  if [ -f "${HOME}/.${f}" ]; then
    echo "backuping ~/.${f}"
    mv "${HOME}/.${f}" "${HOME}/.${f}_${today}"
  fi

  ln -s "$(pwd)/${f}" "${HOME}/.${f}"
done



