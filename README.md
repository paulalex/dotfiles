Dotfiles
=================

This is a repository of my useful linux shell commands presented as dot (.) files, you can load this into
your developer environment to provide a set of functions and commonly used shell commands
wrapped as aliases.

Simply follow the instructions below and the set of files and aliases will be loaded into your
environment ready to use.

Installation Instructions
------

__Warning:__ Installing the dotfiles will potentially overwrite files in your home directory, however
all dotfiles are backed up first into the directory `~/.dotfiles`

Create a directory of your choosing, it doesnt matter where on the file system you like to keep your
repositories, for example:

`mkdir $home/dotfiles && cd $home/dotfiles`

Clone the repository using git:

`git clone https://github.com/paulalex/dotfiles.git $HOME/dotfiles/.dotfiles`

To install run:

`source dotfiles.sh`

To update run:

`source dotfiles.sh`

To configure a new mac:

`source brew.sh && source configure_mac.sh`

Acknowledgements
----------------

After looking at several dotfile repos for inspiration I found @mathiasbynens to be the best
suitable match for me although it contains far too much configuration for my personal preference.

I also found the repository by @paulmillr interesting and there were some useful snippets obtained
from here as well.

• [@mathiasbynens](https://github.com/mathiasbynens/dotfiles)

• [@paulmillr](https://github.com/paulmillr/dotfiles)