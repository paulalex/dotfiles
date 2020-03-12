#!/usr/bin/env bash

git pull origin master;

function boot_strap() {
  # Back-up dotfiles in home dir
  cd ~
  mkdir -p ~/.dotfile-backup
  ls -al ~ | grep -E "\s+\." | awk {'print $9'} | xargs -I {} cp {} ~/.dotfile-backup/{}
  cd -

	rsync --exclude ".git/" \
	  --exclude ".gitignore" \
		--exclude ".DS_Store" \
		--exclude ".osx" \
		--exclude "dotfiles.sh" \
		-exclude "brew.sh" \
		--exclude "README.md" \
		--exclude "LICENSE-MIT.txt" \
		-avh --no-perms . ~;
	source ~/.bash_profile;
}

if [ "$1" == "--force" -o "$1" == "-f" ]; then
	boot_strap
else
	read -rp "This may overwrite existing files in your home directory. Are you sure? (y/n) " -n 1
	echo ""
	if [[ $REPLY =~ ^[Yy]$ ]]; then
		boot_strap
	fi
fi

unset -f boot_strap