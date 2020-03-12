Dotfiles
=================

This is a repository of my useful linux shell commands presented as dot (.) files, you can load this into
your developer environment to provide a set of functions and commonly used shell commands
wrapped as aliases.

Simply follow the instructions below and the set of files and aliases will be loaded into your
environment ready to use.

Installation
------

__Warning:__ Installing the dotfiles will potentially overwrite files in your home directory, however
all dotfiles are backed up first into the directory `~/.dotfiles`

Create a directory of your choosing, it doesnt matter where on the file system you like to keep your
repositories, for example:

`mkdir $home/dotfiles && cd $home/dotfiles`

Clone the repository using git:

`git clone https://github.com/paulalex/dotfiles.git $HOME/dotfiles/.dotfiles`

To install run:

`source bootstrap.sh`























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
for DOTFILE in $(find $HOME/dotfiles -maxdepth 1)
do
  [[ -f "${DOTFILE}" && "${DOTFILE}" == \.* ]] && echo "${DOTFILE}"
done
```

You can then add, commit, list etc and treat `dotfiles` as a standard git repository

```
dot_file status
dot_file add .vimrc
dot_file commit -m "Add vimrc"
dot_file add .bashrc
dot_file commit -m "Add bashrc"
dot_file push
```
