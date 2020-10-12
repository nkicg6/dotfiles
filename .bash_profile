# prompt 
# from http://exprompt.net/
export PS1="\u \[\e[34m\]\W\[\e[m\] \\$ "
# aliases
alias jpy='jupyter notebook'
alias ls='ls -aFGt'
alias mnc='cd ~/Dropbox/lab_notebook/projects_and_data/mnc; ls'

# download installed  python 3.8
alias py38='/Library/Frameworks/Python.framework/Versions/3.8/bin/python3.8'
alias pip38='/Library/Frameworks/Python.framework/Versions/3.8/bin/pip3'

# path
export PATH=/usr/local/sbin:~/bin:~/.local/bin:$PATH
#Ruby
export PATH="/usr/local/opt/ruby/bin:$PATH"
export PATH="$HOME/.gem/ruby/2.7.0/bin:$PATH"
# use downloaded python 3.8 not homebrew python
export PATH=/Library/Frameworks/Python.framework/Versions/3.8/bin:$PATH

# NEURON install
export PATH="/Applications/NEURON-7.7/nrn/x86_64/bin":$PATH #added by NEURON installer

# add rust to path
export PATH="$HOME/.cargo/bin:$PATH"

# virtualenvwrapper
export WORKON_HOME=~/.ve
export VIRTUALENVWRAPPER_PYTHON=/Library/Frameworks/Python.framework/Versions/3.8/bin/python3.8
source /usr/local/bin/virtualenvwrapper.sh

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

# for pipx via `userpath`
export PATH="$PATH:/Users/nick/Library/Python/3.8/bin"

# export for debugging/dev of qtabf explorer
export DEBUG_DIR="/Users/nick/Dropbox/lab_notebook/projects_and_data/mnc/analysis_and_data/patch_clamp/data/passive_membrane_properties_2019-10-26"

export DEBUG_LFP="/Users/nick/Dropbox/lab_notebook/projects_and_data/mnc/analysis_and_data/extracellular_lfp/data/2020-03-14"

# source private env vars
source .private_env_vars
