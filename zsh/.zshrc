ZSH_DISABLE_COMPFIX=true # fix for completion permissions
export PATH=$HOME/bin:/usr/local/bin:$HOME/.local/bin:$PATH

# setup prompt with branch info and git completions
autoload -Uz vcs_info
autoload -Uz compinit && compinit
precmd_vcs_info() { vcs_info }
precmd_functions+=( precmd_vcs_info )

setopt prompt_subst
setopt interactivecomments
autoload -U select-word-style 
autoload -U +X bashcompinit && bashcompinit
select-word-style bash
  # use emacs keybindings. fixes issue in iterm/zsh/tmux
  # where tmux was intercepting Ctrl-a/e and adding ^A/^E
  bindkey -e
  zstyle ':vcs_info:*' formats '(%b)'
  export CLICOLOR=1
  export PS1="%B[%D %*] %F{green}%n%f%F{black}@%f%F{green}%m%f:%F{cyan}%~%f \${vcs_info_msg_0_}
  %%%b "

  export LANG=en_US.UTF-8

  export EDITOR='vim'

# personal bin
export PATH="$HOME/bin":$PATH
export PATH="$HOME/dotfiles/bin":$PATH

# Compilation flags
export ARCHFLAGS="-arch x86_64"
export CGO_ENABLED=1

export PIP_REQUIRE_VIRTUALENV=1
export HOMEBREW_NO_AUTO_UPDATE=1
export GOPATH="$HOME/go"
export PATH="$GOPATH/bin:$PATH"

if [[ $(uname) == "Darwin" ]]; then
  # Python setup MacOS
  PY36="/Library/Frameworks/Python.framework/Versions/3.6/bin"
  PY38="/Library/Frameworks/Python.framework/Versions/3.8/bin"
  PY39="/Library/Frameworks/Python.framework/Versions/3.9/bin"
  PY311="/Library/Frameworks/Python.framework/Versions/3.11/bin"
  export PATH=$PY311:$PY39:$PY38:$PY36:$PATH
fi

alias tf=terraform

bindkey -s '^f' "$HOME/bin/tmux-fzf.sh\n"
