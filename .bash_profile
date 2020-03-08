# prompt 
# from http://exprompt.net/
export PS1="\u \[\e[34m\]\W\[\e[m\] \\$ "
# aliases
alias jupyter='jupyter notebook'
alias ls='ls -aFGt'
alias mnc='cd ~/Dropbox/lab_notebook/projects_and_data/mnc; ls'
# path
export PATH=/usr/local/sbin:~/bin:~/.local/bin:$PATH

# NEURON install
export PATH="/Applications/NEURON-7.7/nrn/x86_64/bin":$PATH #added by NEURON installer
# add rust to path
export PATH="$HOME/.cargo/bin:$PATH"

# virtualenvwrapper
export WORKON_HOME=~/.ve
export VIRTUALENVWRAPPER_PYTHON=/usr/local/bin/python3 
source /usr/local/bin/virtualenvwrapper.sh

# power chime stop!
defaults write com.apple.PowerChime ChimeOnNoHardware -bool true

# terminal emacs
alias em="emacs -nw -q --load='~/.emacs.d/terminal_init.el'"

mkdirs(){
    /bin/mkdir $1;cd $1;ls
}
