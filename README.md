# Bootstrap configs for new machines/VM's

Quickly get up and running in a dev environment with essential tools using ansible and stow. 

The playbook should install properly on MacOS, Ubuntu, and Rocky linux. 

For MacOS, ensure you have `homebrew` and ansible community.general installed:

```ansible-galaxy collection install community.general```

## Use

Use via `ansible-pull`:

```
ansible-pull -U https://github.com/nkicg6/dotfiles.git bootstrap-minimal.yml
```

## TODO

* Refactor bootstrap into tasks, create a bootstrap full version too (vim and emacs while transitioning).
* Create a remove all playbook to remove symbolic links. 
