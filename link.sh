#!/bin/bash

backfold="${HOME}/.dotfiles-backup"
mkdir -p "${backfold}"
today="$(date '+%y-%m-%d')"
files=( vimrc bash_profile tmux.conf tmux-osx.conf )

for f in "${files[@]}"; do
  if [ -L "${HOME}/.${f}" ]; then
    rm "${HOME}/.${f}"
  elif [ -f "${HOME}/.${f}" ]; then
    echo "backuping ~/.${f}"
    mv "${HOME}/.${f}" "${backfold}/.${f}_${today}"
  fi

  ln -s "$(pwd)/${f}" "${HOME}/.${f}"
done



