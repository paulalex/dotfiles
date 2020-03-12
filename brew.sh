#!/usr/bin/env bash
# Install command-line tools using Homebrew.
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"

# Make sure we’re using the latest Homebrew.
brew update

# Upgrade any already-installed formulae.
brew upgrade

# Install GNU `find`, `locate`, `updatedb`, and `xargs`, `g`-prefixed.
brew install findutils

# Install GNU `sed`, overwriting the built-in `sed`.
brew install gnu-sed --with-default-names

brew install python

brew install google-authenticator-libpam

brew install openssl

brew install git-crypt

brew install kompose

brew install awscli

brew install kubernetes-cli

brew install telnet

brew install tfenv

brew install tree

brew install jq

brew install git

brew install git-crypt

brew install Openssl

brew install wget

brew install kns

# Remove outdated versions from the cellar.
brew cleanup