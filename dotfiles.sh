#!/bin/bash

function dot_files {
   /usr/bin/git --git-dir="$HOME"/dotfiles/.dotfiles/ --work-tree="$HOME"/dotfiles "$@"
}

mkdir -p .dotfile-backup

dot_files checkout

if [ $? = 0 ]; then
  echo "Checked out for files.";
  else
    echo "Backing up pre-existing dot files.";
    dot_files checkout 2>&1 | grep -E "\s+\." | awk {'print $1'} | xargs -I{} mv {} .dotfile-backup/{}
fi;

dot_files config status.showUntrackedFiles no

# Load the dotfiles
# shellcheck disable=SC2044
for DOTFILE in $(find "$HOME"/dotfiles)
do
  [ -f "$DOTFILE" ] && source "$DOTFILE"
done