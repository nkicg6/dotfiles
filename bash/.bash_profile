# .bash_profile
# Get the aliases and functions
if [ -f ~/.bashrc ]; then
. ~/.bashrc
fi

export LANG=en_US.UTF-8
export EDITOR=nvim
PS1='${PROMPT_START@P}\[\e[${PROMPT_COLOR}m\]\u@\h:\w $ ${PROMPT_END@P}\[\e[0m\]'
export PATH="$HOME/bin:/usr/local/bin:$HOME/.local/bin:$PATH"
# Compilation flags
export ARCHFLAGS="-arch x86_64"
export CGO_ENABLED=1

export PIP_REQUIRE_VIRTUALENV=1
export GOPATH="$HOME/go"
export PATH="$GOPATH/bin:$PATH"

shopt -s histappend
export HISTSIZE=100000
export HISTCONTROL=ignoredups:erasedups
#export PROMPT_COMMAND="history -a; history -c; history -r; $PROMPT_COMMAND"
bind '"\C-f":"$HOME/bin/tmux-fzf.sh\n"'
