Dotfiles - My personal set of dotfiles
=================

This is a repository of useful linux shell commands presented as dot (.) files, you can load this into
your developer environment to provide a set of useful functions and commonly used shell commands
wrapped as aliases.

Simply follow the instructions below and the set of files and aliases will be loaded into your
environment ready to use.


* Step 1: 

`mkdir $home/dotfiles`

* Step 2: 

`git clone --bare https://github.com/paulalex/dotfiles.git $HOME/dotfiles/.dotfiles`

* Step 3 - Run following shell-script:

```
#!/bin/bash

function dot_files {
   /usr/bin/git --git-dir=$HOME/dotfiles/.dotfiles/ --work-tree=$HOME/dotfiles $@
}

mkdir -p .dotfile-backup

dot_files checkout

if [ $? = 0 ]; then
  echo "Checked out for files.";
  else
    echo "Backing up pre-existing dot files.";
    dot_files checkout 2>&1 | egrep "\s+\." | awk {'print $1'} | xargs -I{} mv {} .dotfile-backup/{}
fi;

dot_files config status.showUntrackedFiles no

# Load the dotfiles
for DOTFILE in $(find $HOME/dotfiles)
do
  [ -f “$DOTFILE” ] && source “$DOTFILE”
done
```

You can then add, commit, list etc and treat `dotfiles` as a standard git repository

```
config status
config add .vimrc
config commit -m "Add vimrc"
config add .bashrc
config commit -m "Add bashrc"
config push
```
