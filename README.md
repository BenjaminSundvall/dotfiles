# dotfiles

## TODO
- [ ] Remove batcat use from zsh? I don't think I will use it...
- [x] Make Starship config more minimal (user, dir, git, time?)
- [/] Fix tmux binds to match vim: new window, ~~close windows (no confirm)~~, move windows, tabs, resizing, ~~splitting~~
- [ ] Install vimwiki and integrate with obsidian vault
- [ ] Set up keyd (or other) keymapper. Especially for Caps Lock -> Esc (tap) / Ctrl (hold)
- [ ] AI/autocomplete in nvim (look into ollama, supermaven, claude code, cursor cli, avante, neocodeium)

## Inspiration

### Zsh

The Zsh config is based on The Rad Lectures' setup:
- https://www.youtube.com/watch?v=1jE7rCvByHg
- https://github.com/radleylewis/zsh/

### Neovim

The Neovim config is based on nvim kickstart:
- https://www.youtube.com/watch?v=m8C0Cq9Uv9o
- https://github.com/nvim-lua/kickstart.nvim

## Downloads

```bash
sudo apt install alacritty zsh tmux neovim

# Neovim Kickstart
sudo apt install ripgrep fd-find rustup
cargo binstall tree-sitter-cli

# zsh
sudo apt install zoxide fzf
sudo apt install eza fd-find ripgrep bat

# Starship
curl -sS https://starship.rs/install.sh | sh

# TMUX
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
```

## Linking Dotfiles
```bash
cd ~/dotfiles
stow */
```

## Zsh Cheat Sheet
```bash
C-r     Reverse command search
C-t     ? (see /usr/share/doc/fzf/examples/key-bindings.zsh
A-c     ? (see /usr/share/doc/fzf/examples/key-bindings.zsh
```

## tmux Cheat Sheet
```tmux
<prefix> = C-Space

Sessions:
  tmux new -s project       Create named session
  tmux ls                   List sessions
  tmux attach -t project    Reattach
  <prefix> d                Detach
  <prefix> $                Rename session
  <prefix> \                Kill tmux server

Windows (tabs):
  <prefix> c                New window
  <prefix> ,                Rename window
  <prefix> n / C-a p        Next / previous window
  <prefix> <number>         Jump to window by number
  <prefix> C-Space          Window picker (interactive, shows all sessions)

Panes:
  <prefix> v                Vertical split
  <prefix> s                Horizontal split
  C-h/j/k/l                 Navigate panes
  <prefix> z                Zoom pane to full window (toggle)
  C-q                       Kill pane

Copy mode:
  <prefix> [                Enter copy mode (scroll with j/k, search with /)
  v                         Start selection
  V                         Start line selection
  y                         Yank and exit
  q                         Exit copy mode

```
