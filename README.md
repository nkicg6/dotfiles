# Bootstrap configs for new machines/VM's
Quickly get up and running in a dev environment with essential tools using ansible and stow. 

The playbook should install properly on MacOS, Ubuntu, and Rocky linux (if you have sudo privileges)

For MacOS, ensure you have `homebrew` and ansible's `community.general` installed:

```ansible-galaxy collection install community.general```

## Use

Use via `ansible-pull`:

```
ansible-pull -U https://github.com/nkicg6/dotfiles.git bootstrap-minimal.yml
```

## TODO

* Create a remove all playbook to remove symbolic links. 


## Software for full install (create roles)
- `fzf`
- `go`
- `gopls` (via go)
- `rust`
- `python3.11`
- `xclip` (linux)

