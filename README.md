# Dotfiles and notes

## Linking dotfiles

- Copy whatever dotfile is in $HOME to the source controlled one. 
- `rm` the one in $HOME
- Create a link from the source controlled to home. For example for `.zshrc`:

```
cp ~/.zshrc ~/bin/.zshrc
rm ~/.zshrc
ln -s ~/bin/.zshrc ~/.zshrc`
```

## Emacs

`.emacs.d/` lives [here](https://github.com/nkicg6/emacs-config).

## Homebrew
After installing a homebrew package, I run =make= from this directory so I can keep a list of the packages I have installed via homebrew. 

## Python tox setup

Based on https://www.youtube.com/watch?v=PrAyvH-tm8E 

```
python3 -m venv ~/.toxbase
~/.toxbase/bin/pip install tox
~/.toxbase/bin/tox --version
# should work!
# Now link it to somewhere on your $PATH so you can use it everywhere
ln -s ~/.toxbase/bin/tox ~/bin/tox
```


