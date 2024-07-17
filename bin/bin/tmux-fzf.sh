#!/usr/bin/env bash
session=$(find $HOME/dev $HOME/dotfiles $HOME/personal $HOME/bioteam $HOME/personal_projects $HOME/projects -type d -mindepth 1 -maxdepth 2 |fzf)
session_name=$(basename "$session"|tr . _)
tmux has-session -t "$session_name" 2>/dev/null
if [ $? != 0 ]; then
  tmux new-session -s "$session_name" -c "$session" -d 
fi
if [ -n "$TMUX" ]; then
  tmux switch-client -t "$session_name"
else
  tmux attach-session -t "$session_name"
fi
