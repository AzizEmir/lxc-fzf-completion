# LXC Container Missing Autocompletion and More !

![image](https://github.com/user-attachments/assets/7ffcd734-9465-4e29-8733-eb55b41af781)

## Description

This script enhances the lxc-start, lxc-stop, and similar LXC commands with auto-completion functionality using fzf. 
By combining LXC container names with fzf's interactive fuzzy search, users can easily select a container from a list with a preview of its configuration. Additionally, 
if available, the script displays the container's index.md file along with its config file, making it easier to review container-specific details before performing actions like starting or stopping.

> [!TIP]
> Shows the contents of the index.md file, followed by the config file preview after the --- separator.



## Installation

No manual configuration required—just add the script to your environment and use it immediately. bashrc, zshrc etc.

```shell
_lxc_start_complete() {
    local containers
    containers=$(find /var/lib/lxc -maxdepth 1 -mindepth 1 -type d -exec basename {} \; | sort)
    selected=$(echo "$containers" | fzf --preview "cat /var/lib/lxc/{}/index.md; echo \"\n---\n\"; cat /var/lib/lxc/{}/config" --preview-window=up:70%:wrap)
    if [[ -n "$selected" ]]; then
        echo "$selected"
    fi
}

complete -F _lxc_start_complete lxc-start lxc-stop lxc-attach
```

> [!NOTE]  
>Tested in bash and zsh.

## Example Usage:

```
lxc-start [TAB]   # Auto-completion will suggest available container names.
```
