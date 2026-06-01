# Better ls
alias ls='eza --icons'

# Detailed listing
alias ll='eza -lh --icons --git'

# Detailed listing including hidden files
alias la='eza -lah --icons --git'

# Tree view
alias tree='eza --tree --icons'

# Reuse ls completions for eza (avoids defining a separate completion function)
compdef eza=ls

# Better cat (bat on Arch, batcat on Ubuntu)
if command -v bat >/dev/null 2>&1; then
    alias cat='bat'
elif command -v batcat >/dev/null 2>&1; then
    alias bat='batcat'
    alias cat='batcat'
fi

# fd (fdfind on Ubuntu)
if command -v fdfind >/dev/null 2>&1; then
    alias fd='fdfind'
fi


# =========================================================
# Core utilities
# =========================================================

alias grep='rg --color=auto'
alias diff='diff --color=auto'
alias df='df -h'
alias lg='lazygit'

# =========================================================
# Navigation
# =========================================================

lf() { # zsh follow lf navigation
    tmp=$(mktemp)
    command lf -last-dir-path="$tmp" "$@"
    if [ -f "$tmp" ]; then
        dir=$(cat "$tmp")
        rm -f "$tmp"
        [ -d "$dir" ] && [ "$dir" != "$(pwd)" ] && cd "$dir"
    fi
}

# Automatically ls after cd
cd() { builtin cd "$@"; ls; }

# =========================================================
# Editor
# =========================================================

alias vim='nvim'

# =========================================================
# Git
# =========================================================

alias glog='PAGER="less -F -X" git log'                              # -F quit if one screen, -X no clear on exit
alias gadog='PAGER="less -F -X" git log --all --decorate --oneline --graph'

# =========================================================
# Video
# =========================================================

alias stream='mpv av://v4l2:/dev/video4 --fullscreen --demuxer-lavf-o=input_format=mjpeg,framerate=30 --profile=low-latency --untimed'

# =========================================================
# Config
# =========================================================
#
DOTFILES_DIR="${HOME}/dotfiles"
alias dots="cd ${DOTFILES_DIR} && nvim ."
alias cfv="nvim ${DOTFILES_DIR}/nvim/.config/nvim/init.lua"
alias cft="nvim ${DOTFILES_DIR}/tmux/.config/tmux/tmux.conf"
alias cfs="nvim ${DOTFILES_DIR}/starship/.config/starship.toml"
alias cfz="nvim ${DOTFILES_DIR}/zsh/.config/zsh/.zshrc"
alias cfa="nvim ${DOTFILES_DIR}/alacritty/.config/alacritty/alacritty.toml"

