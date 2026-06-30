# Based on The Rad Lectures' setup
# https://www.youtube.com/watch?v=1jE7rCvByHg
# https://github.com/radleylewis/zsh/
# 
# ~/dotfiles/zsh/
# └── .config/
#     └── zsh/
#         ├── .zshenv
#         ├── .zshrc
#         ├── aliases.zsh
#         ├── bindings.zsh
#         ├── fzf.zsh
#         ├── plugins.zsh
#         └── prompt.zsh

# =========================================================
# PATH
# =========================================================

export PATH="$HOME/.cargo/bin:$PATH"

# =========================================================
# History
# =========================================================

HISTFILE="$XDG_STATE_HOME/zsh/history"
HISTSIZE=100000
SAVEHIST=100000

setopt APPEND_HISTORY
setopt SHARE_HISTORY
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_SPACE
setopt HIST_EXPIRE_DUPS_FIRST
setopt HIST_FIND_NO_DUPS

# =========================================================
# Shell behaviour
# =========================================================

setopt AUTOCD
setopt NOBEEP
setopt NUMERIC_GLOB_SORT  # sort file10 after file9, not after file1

stty -ixon  # disable Ctrl-S / Ctrl-Q flow control

# =========================================================
# Smart directory navigation & lf
# =========================================================

# LF_ICONS=$(cat ~/.config/lf/icons | tr '\n' ':')
# export LF_ICONS

# Initialize zoxide
eval "$(zoxide init zsh)"

# =========================================================
# Completion
# =========================================================

# Load completion system
autoload -Uz compinit

# Initialize completion with cached metadata file
compinit -d "$XDG_CACHE_HOME/zsh/zcompdump"

# Enable interactive completion menu selection
zstyle ':completion:*' menu select

# Make completion case-insensitive
# Example: "doc" can complete to "Documents"
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'  # lowercase input matches upper and lower

# =========================================================
# Fuzzy finder
# =========================================================

# macOS / Homebrew (Apple Silicon)
if [[ -f /opt/homebrew/opt/fzf/shell/key-bindings.zsh ]]; then
  source /opt/homebrew/opt/fzf/shell/key-bindings.zsh
  source /opt/homebrew/opt/fzf/shell/completion.zsh
fi

# macOS / Homebrew (Intel)
if [[ -f /usr/local/opt/fzf/shell/key-bindings.zsh ]]; then
  source /usr/local/opt/fzf/shell/key-bindings.zsh
  source /usr/local/opt/fzf/shell/completion.zsh
fi

# Arch
if [[ -f /usr/share/fzf/key-bindings.zsh ]]; then
  source /usr/share/fzf/key-bindings.zsh
  source /usr/share/fzf/completion.zsh
fi

# Ubuntu
if [[ -f /usr/share/doc/fzf/examples/key-bindings.zsh ]]; then
  source /usr/share/doc/fzf/examples/key-bindings.zsh
  source /usr/share/doc/fzf/examples/completion.zsh
fi

# =========================================================
# Modular Config Files
# =========================================================

# fzf configuration
source "$ZDOTDIR/fzf.zsh"

# Aliases
source "$ZDOTDIR/aliases.zsh"

# Custom keybindings
source "$ZDOTDIR/bindings.zsh"

# Plugins and plugin manager
source "$ZDOTDIR/plugins.zsh"

# Prompt/theme
source "$ZDOTDIR/prompt.zsh"

# =========================================================
# Ensure the TMUX main session exists (detached, no auto-attach)
# =========================================================

# Start the 'main' session in the background if it isn't already running.
# Use `t` to attach manually (see aliases.zsh).

# No manual print
# if command -v tmux &>/dev/null && [ -z "$TMUX" ]; then
#     tmux has-session -t main 2>/dev/null || tmux new-session -d -s main &
# fi

# Manual print
if command -v tmux &>/dev/null && [ -z "$TMUX" ] && ! tmux has-session -t main 2>/dev/null; then
  { tmux new-session -d -s main && echo "Tmux session \"main\" started! (use command \"t\" to attach)\n" } &!
fi
