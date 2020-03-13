# Execute source on all of the dotfiles
for file in ~/.{aliases,environment,git_functions,k8s_functions,shell_functions}; do
    [ -r "${file}" ] && [ -f "${file}" ] && source "${file}"
done

unset file

# Change default shell to bash installed by brew
echo /usr/local/bin/bash | sudo tee -a /etc/shells
chsh -s /usr/local/bin/bash

# Case-insensitive globbing (used in pathname expansion)
shopt -s nocaseglob

# Append to the Bash history file, rather than overwriting it
shopt -s histappend

# Autocorrect typos in path names when using `cd`
shopt -s cdspell

# Add tab completion for SSH hostnames based on ~/.ssh/config, ignoring wildcards
[ -e "$HOME/.ssh/config" ] && complete -o "default" -o "nospace" -W "$(grep "^Host" ~/.ssh/config | grep -v "[?*]" | cut -d " " -f2- | tr ' ' '\n')" scp sftp ssh

# Enable tab completion for `g` by marking it as an alias for `git`
if type _git &> /dev/null; then
	complete -o default -o nospace -F _git g
fi

# Enable bash autocompletion
if type brew &>/dev/null; then
  HOMEBREW_PREFIX="$(brew --prefix)"
  if [[ -r "${HOMEBREW_PREFIX}/etc/profile.d/bash_completion.sh" ]]; then
    source "${HOMEBREW_PREFIX}/etc/profile.d/bash_completion.sh"
  fi
  for COMPLETION in "${HOMEBREW_PREFIX}/etc/bash_completion.d/"*; do
      [[ -r "$COMPLETION" ]] && source "$COMPLETION"
  done
fi
