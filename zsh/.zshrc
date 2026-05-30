if command -v tmux &>/dev/null && [ -z "$TMUX" ]; then
    tmux new-session -A -s main
fi

# Config Aliases
DOTFILES_DIR="${HOME}/dotfiles"
alias dots="cd ${DOTFILES_DIR}"
alias cft="nvim ${DOTFILES_DIR}/tmux/.tmux.conf"
alias cfz="nvim ${DOTFILES_DIR}/zsh/.zshrc"

alias vim='nvim'
