# makefile to update the lists of installed homebrew packages

update:
	brew list > homebrew_packages.txt
	brew cask list > homebrew_cask_packages.txt
