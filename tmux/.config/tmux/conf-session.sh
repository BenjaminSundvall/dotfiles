#!/usr/bin/env sh
# Launch (or attach to) the "config" tmux session for editing dotfiles.
session="config"
win_editor=" Neovim"
win_claude="󰚩 Claude"
dir="${HOME}/dotfiles"

if ! tmux has-session -t "$session" 2>/dev/null; then
  tmux new-session -d -s "$session" -c "$dir" -n "$win_editor"
  tmux send-keys -t "$session:$win_editor" 'nvim .' C-m

  tmux new-window -t "$session" -c "$dir" -n "$win_claude"
  tmux send-keys -t "$session:$win_claude" 'claude' C-m

  tmux select-window -t "$session:$win_editor"
fi

if [ -n "$TMUX" ]; then
  tmux switch-client -t "$session"
else
  tmux attach-session -t "$session"
fi
