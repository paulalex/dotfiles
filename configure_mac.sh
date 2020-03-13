#!/usr/bin/env bash

# Update the sudoers file so admin user doesnt have to enter their password
sudo gsed -i 's|^%admin          ALL = (ALL) ALL|%admin          ALL = (ALL) NOPASSWD: ALL|' /etc/sudoers

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

# Check for software updates daily, not just once per week
defaults write com.apple.SoftwareUpdate ScheduleFrequency -int 1

# Save screenshots to downloads folder
defaults write com.apple.screencapture location "$HOME/Downloads/"

# Turn dark mode on
osascript -e 'tell app "System Events" to tell appearance preferences to set dark mode to true'
