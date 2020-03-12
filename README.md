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