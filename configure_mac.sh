#!/usr/bin/env bash

# create repos folder
mkdir ~/git_repos


# Install tools using homebrew
source brew.sh

# Install my developer tools from macapps etc
curl -s 'https://api.macapps.link/en/firefoxdev' | sh

curl -s 'https://api.macapps.link/en/chrome' | sh

curl -s 'https://api.macapps.link/en/evernote' | sh

curl -s 'https://api.macapps.link/en/atom' | sh

curl -s 'https://api.macapps.link/en/pycharm' | sh

curl -s 'https://api.macapps.link/en/gitkraken' | sh

curl -s 'https://api.macapps.link/en/intellij' | sh

curl -s 'https://api.macapps.link/en/iterm' | sh

curl -s 'https://api.macapps.link/en/tunnelblick' | sh

curl -s 'https://api.macapps.link/en/spectacle' | sh

curl -s 'https://api.macapps.link/en/gimp' | sh

curl -s 'https://api.macapps.link/en/whatsapp' | sh

curl -s 'https://api.macapps.link/en/slack' | sha secret

# Install virtualenvwrapper
pip3 install virtualenvwrapper

# Finally source the virtualenv wrapper script
source /usr/local/bin/virtualenvwrapper.sh

# Copy spectacle shortcuts file
cp -r config/Shortcuts.json ~/Library/Application\ Support/Spectacle/Shortcuts.json 2> /dev/null

# Install iterm theme
open "config/Cobalt2.itermcolors"
