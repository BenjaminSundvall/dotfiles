#!/usr/bin/env sh
# Launch (or attach to) the "config" tmux session for editing dotfiles.
session="config"
dir="${HOME}/dotfiles"

if ! tmux has-session -t "$session" 2>/dev/null; then
  tmux new-session -d -s "$session" -c "$dir" -n Editor
  tmux send-keys -t "$session:Editor" 'nvim .' C-m

  tmux new-window -t "$session" -c "$dir" -n Claude
  tmux send-keys -t "$session:Claude" 'claude' C-m

  tmux select-window -t "$session:Editor"
fi

if [ -n "$TMUX" ]; then
  tmux switch-client -t "$session"
else
  tmux attach-session -t "$session"
fi
