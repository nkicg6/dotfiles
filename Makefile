# makefile to update the lists of installed homebrew packages

update:
	brew list --formula > homebrew_packages.txt
	brew list --cask > homebrew_cask_packages.txt
