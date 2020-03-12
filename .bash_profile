# Execute source on all of the dotfiles
for file in ~/.{aliases,environment,git_functions,k8s_functions,shell_functions}; do
    [ -r "${file}" ] && [ -f "${file}" ] && source "${file}"
done

unset file