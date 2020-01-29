# prompt 
# from http://exprompt.net/
export PS1="\u \[\e[34m\]\W\[\e[m\] \\$ "
# aliases
alias jupyter='pipenv run jupyter notebook'
alias ls='ls -aFG'
alias mnc='cd ~/Dropbox/lab_notebook/projects_and_data/mnc; ls'
alias cdd='cd;ls'
# path
export PATH=/usr/local/sbin:~/bin:~/.local/bin:$PATH

# NEURON install
export PATH="/Applications/NEURON-7.7/nrn/x86_64/bin":$PATH #added by NEURON installer
#export PYTHONPATH="/Applications/NEURON-7.7/nrn/lib/python":$PYTHONPATH #added by NEURON installer

# virtualenvwrapper
export WORKON_HOME=~/.ve
export VIRTUALENVWRAPPER_PYTHON=/usr/local/bin/python3 
source /usr/local/bin/virtualenvwrapper.sh

# power chime stop!
defaults write com.apple.PowerChime ChimeOnNoHardware -bool true

