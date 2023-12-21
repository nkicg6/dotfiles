# Bootstrap config

Quickly get up and running with a basic development environment using ansible and stow.

The playbook should install properly on MacOS, Ubuntu, and Rocky linux but requires sudo.

For MacOS, `homebrew` and ansible's `community.general` are required:

```ansible-galaxy collection install community.general```

## Use

Use via `ansible-pull`:

```
ansible-pull -U https://github.com/nkicg6/dotfiles.git bootstrap-minimal.yml
```

## Other software to add to ansible roles
- `fzf`
- `go` and `gopls`
- `rust` and `rust-analyzer`
- `python3.11`
- `xclip` (linux)

## TODO
- Should have a playbook for non-sudo installations wherever possible
