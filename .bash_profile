# prompt 
# from http://exprompt.net/
export PS1="\u \[\e[34m\]\W\[\e[m\] \\$ "
# aliases
alias jupyter='pipenv run jupyter notebook'
alias mnc='cd ~/Dropbox/lab_notebook/projects_and_data/mnc'
alias ls='ls -aFG'
# NEURON install
export IDIR="/Applications/NEURON-7.5"
export IV="$IDIR/iv"
export N="$IDIR/nrn"
export CPU=x86_64
# path
export PATH=$IV/$CPU/bin:$N/$CPU/bin:/usr/local/sbin:~/bin:$PATH
