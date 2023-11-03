#!/usr/bin/env bash

session=$(find $HOME $HOME/dev $HOME/dotfiles $HOME/personal $HOME/bioteam -type d -mindepth 1 -maxdepth 1 |fzf)
session_name=$(basename "$session"|tr . _)
if ! tmux has-session -t "$session_name" 2>/dev/null; then
  tmux new-session -s "$session_name" -c "$session" -d 
fi
tmux switch-client -t "$session_name"
