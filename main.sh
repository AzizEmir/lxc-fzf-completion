_lxc_start_complete() {
    local containers
    containers=$(find /var/lib/lxc -maxdepth 1 -mindepth 1 -type d -exec basename {} \; | sort)
    selected=$(echo "$containers" | fzf --preview "cat /var/lib/lxc/{}/index.md; echo \"\n---\n\"; cat /var/lib/lxc/{}/config" --preview-window=up:70%:wrap)
    if [[ -n "$selected" ]]; then
        echo "$selected"
    fi
}

complete -F _lxc_start_complete lxc-start lxc-stop lxc-attach
