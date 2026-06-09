# dotfiles

## TODO
- [ ] Remove batcat use from zsh? I don't think I will use it...
- [x] Make Starship config more minimal (user, dir, git, time?)
- [/] Fix tmux binds to match vim: new window, ~~close windows (no confirm)~~, move windows, tabs, resizing, ~~splitting~~
- [ ] Install vimwiki or [obsidian.nvim](https://github.com/epwalsh/obsidian.nvim) and integrate with obsidian vault
- [x] Set up keyd (or other) keymapper. Especially for Caps Lock -> Esc (tap) / Ctrl (hold)
- [ ] AI/autocomplete in nvim (look into ollama, supermaven, claude code, cursor cli, avante, neocodeium)
- [ ] Rename commit prefixes to match specific tool (e.g. [zsh] instead of [shell])
- [ ] Set up installer script for packages (both Ubuntu and Arch)

## Inspiration

### Zsh

The Zsh config is based on The Rad Lectures' setup:
- https://github.com/radleylewis/zsh/
- https://www.youtube.com/watch?v=1jE7rCvByHg

### Neovim

The Neovim config is based on nvim kickstart:
- https://github.com/nvim-lua/kickstart.nvim
- https://www.youtube.com/watch?v=m8C0Cq9Uv9o

## Downloads

### Ubuntu
```bash
sudo apt install stow
sudo apt install alacritty zsh tmux
# Need latest version of nvim...
sudo snap install nvim 

# Neovim Kickstart
sudo apt install ripgrep fd-find rustup
cargo install cargo-binstall --locked
cargo binstall tree-sitter-cli

# zsh
sudo apt install zoxide fzf
sudo apt install eza fd-find ripgrep bat

# Starship
curl -sS https://starship.rs/install.sh | sh
```

## Set up tmux package manager
```bash
git clone https://github.com/tmux-plugins/tpm ~/.config/tmux/plugins/tpm
```

Then start tmux, press `<prefix>I` followed by `<prefix>r`. This should install packages and reload tmux.

## Additional Zsh setup
Add the following to `/etc/zsh/zshenv`:
```
if [[ -z "$XDG_CONFIG_HOME" ]]
then
    export XDG_CONFIG_HOME="$HOME/.config"
fi

if [[ -d "$XDG_CONFIG_HOME/zsh" ]]
then
    export ZDOTDIR="$XDG_CONFIG_HOME/zsh"
fi
```

Then change default shell to Zsh with `chsh -s $(which zsh)`. Log out and back in for the change to take effect.

## Installing a nerd font
https://petronellatech.com/blog/nerd-fonts-guide/

```bash
# Create font directory if it doesn't exist
mkdir -p ~/.local/share/fonts

# Download and extract (example: FiraCode)
wget https://github.com/ryanoasis/nerd-fonts/releases/latest/download/FiraCode.zip
unzip FiraCode.zip -d ~/.local/share/fonts/FiraCode

# Rebuild font cache
fc-cache -fv

# Verify installation
fc-list | grep "FiraCode"
```

## Install LazyGit
Ubuntu >25:
```bash
sudo apt instlal lazygit
```

Ubuntu <=25:
```bash
LAZYGIT_VERSION=$(curl -s "https://api.github.com/repos/jesseduffield/lazygit/releases/latest" | \grep -Po '"tag_name": *"v\K[^"]*')
LAZYGIT_ARCH=$(uname -m | sed -e 's/aarch64/arm64/')
curl -Lo lazygit.tar.gz "https://github.com/jesseduffield/lazygit/releases/download/v${LAZYGIT_VERSION}/lazygit_${LAZYGIT_VERSION}_Linux_${LAZYGIT_ARCH}.tar.gz"
tar xf lazygit.tar.gz lazygit
sudo install lazygit -D -t /usr/local/bin/
```

## Linking Dotfiles
```bash
cd ~/dotfiles
# keyd is not stow-managed (see below), so don't bulk-stow it
stow alacritty git nvim starship tmux zsh
```

### keyd (not stow-managed)

keyd is a system daemon and only reads `/etc/keyd/` — it ignores `~/.config`,
so it can't be linked with `stow`. The config is kept in this repo and
symlinked into place manually:

First, install keyd from source (see [repo](https://github.com/rvaiya/keyd))


```bash
git clone https://github.com/rvaiya/keyd
cd keyd
make && sudo make install
sudo systemctl enable --now keyd
```

Then create a symlink
```bash
sudo ln -sf ~/dotfiles/keyd/default.conf /etc/keyd/default.conf
sudo systemctl enable --now keyd
sudo keyd reload   # after any edit to the config
```
## Verify install
To verify that everything installed correctly, open a new Alacritty window and run `dots`.

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
