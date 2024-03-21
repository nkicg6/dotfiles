PS1='\u@\h:\w \\$ '
export PATH="$HOME/bin:/usr/local/bin:$HOME/.local/bin:$PATH"
# Compilation flags
export ARCHFLAGS="-arch x86_64"
export CGO_ENABLED=1

export PIP_REQUIRE_VIRTUALENV=1
export HOMEBREW_NO_AUTO_UPDATE=1
export GOPATH="$HOME/go"
export PATH="$GOPATH/bin:$PATH"

shopt -s histappend
export HISTSIZE=100000
export HISTCONTROL=ignoredups:erasedups
#export PROMPT_COMMAND="history -a; history -c; history -r; $PROMPT_COMMAND"
