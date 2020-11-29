# prompt 
# from http://exprompt.net/
export PS1="\u \[\e[34m\]\W\[\e[m\] \\$ "

# aliases
alias lss='ls -aFGtlh'
alias mnc='cd ~/Dropbox/lab_notebook/projects_and_data/mnc; ls'

# Basics: homebrew bin, personal bin
export PATH=/usr/local/sbin:~/bin:~/.local/bin:$PATH

# Ruby
export PATH="/usr/local/opt/ruby/bin:$PATH"
export PATH="$HOME/.gem/ruby/2.7.0/bin:$PATH"

# Python setup
PY37="/Library/Frameworks/Python.framework/Versions/3.7/bin"
PY38="/Library/Frameworks/Python.framework/Versions/3.8/bin"
PY39="/Library/Frameworks/Python.framework/Versions/3.9/bin"

# main python version
export PATH=$PY38:$PATH

# Other python versions for tox setup (end of path) from https://www.youtube.com/watch?v=PrAyvH-tm8E
export PATH=$PATH:$PY37:$PY39

# python virtualenvwrapper
export WORKON_HOME=~/.ve
export VIRTUALENVWRAPPER_PYTHON="$PY38/python3.8"
source /usr/local/bin/virtualenvwrapper.sh

# NEURON install
export PATH="/Applications/NEURON-7.7/nrn/x86_64/bin":$PATH #added by NEURON installer

# add rust to path
export PATH="$HOME/.cargo/bin:$PATH"

# power chime stop!
defaults write com.apple.PowerChime ChimeOnNoHardware -bool true

# terminal emacs
alias em="emacs -nw -q --load='~/.emacs.d/terminal_init.el'"

# clojure with rebel readline alias
alias cljr='clj -A:rebel'
mkdirs(){
    /bin/mkdir $1;cd $1;ls
}

# inkscape alias
alias inkscape=/Applications/Inkscape.app/Contents/MacOS/Inkscape

# homebrew qt
export PATH="/usr/local/opt/qt/bin:$PATH"

# source private env vars
source "$HOME/.private_env_vars"

# golang
export GOPATH="$HOME/go"

# FontForge
alias ff="/Applications/FontForge.app/Contents/MacOS/FontForge"
