# makefile to update homebrew
update:
	brew list > homebrew_packages.txt
	brew cask list > homebrew_cask_packages.txt
