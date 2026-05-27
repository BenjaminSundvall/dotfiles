# dotfiles

## Downloads

```bash
sudo apt install alacritty zsh tmux neovim

# oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```

## Tmux Cheat Sheet
```bash
Prefix = C-a (after the config above)

Sessions:
  tmux new -s project       Create named session
  tmux ls                   List sessions
  tmux attach -t project    Reattach
  C-a d                     Detach
  C-a $                     Rename session
  C-a s                     Session picker (interactive)

Windows (tabs):
  C-a c                     New window
  C-a ,                     Rename window
  C-a n / C-a p             Next / previous window
  C-a <number>              Jump to window by number
  C-a w                     Window picker (interactive, shows all sessions)

Panes:
  C-a |                     Vertical split   (from config above)
  C-a -                     Horizontal split (from config above)
  C-a h/j/k/l              Navigate panes   (from config above)
  C-a z                     Zoom pane to full window (toggle)
  C-a x                     Kill pane
  C-a {  /  C-a }           Swap pane left / right
  C-a Space                 Cycle pane layouts

Copy mode:
  C-a [                     Enter copy mode (scroll with j/k, search with /)
  v                         Start selection
  y                         Yank and exit
  q                         Exit copy mode

```

## Linking Dotfiles
```bash
cd ~/dotfiles
stow */
```

## Quick Reference

```
TMUX                              NEOVIM
─────────────────────────         ─────────────────────────
C-a c       new window            <leader>ff  find files
C-a n/p     next/prev window      <leader>fg  live grep
C-a |       vertical split        <leader>fb  buffers
C-a -       horizontal split      gd          go to definition
C-a z       zoom pane             gr          references
C-a w       session overview      K           hover docs
C-a [       copy mode             <leader>ca  code action
C-a d       detach                <leader>rn  rename symbol
C-a s       session picker        ]d / [d     next/prev diagnostic
C-a $       rename session        ]q / [q     next/prev quickfix
```

