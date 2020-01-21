# prompt 
# from http://exprompt.net/
export PS1="\u \[\e[34m\]\W\[\e[m\] \\$ "
# aliases
alias jupyter='pipenv run jupyter notebook'
alias mnc='cd ~/Dropbox/lab_notebook/projects_and_data/mnc'
alias ls='ls -aFG'

# path
export PATH=/usr/local/sbin:~/bin:$PATH

# NEURON install
export PATH="/Applications/NEURON-7.7/nrn/x86_64/bin":$PATH #added by NEURON installer
export PYTHONPATH="/Applications/NEURON-7.7/nrn/lib/python":$PYTHONPATH #added by NEURON installer
