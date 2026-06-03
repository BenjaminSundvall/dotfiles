# Dotfiles

## Working agreement

- **Do not edit dotfiles directly.** The user makes all changes themselves in order to learn.
- Instead: explain the change, show the exact snippet/diff to apply, and let the user apply it.
- Answer questions and propose solutions, but leave the actual file edits to the user.
- **Record preferences here, not in global memory.** Any working/formatting
  preference goes in this file unless the user explicitly says to use global memory.

## Answer formatting

When proposing a line/snippet to apply, format the answer in this order, using a
header for each section:
1. `## Add to <file>:<line>` — the line(s) to add, in a code block, nothing before it.
   Use `Replace`/`Change` instead of `Add` for modifications.
2. `## Breakdown` — a list explaining each argument/part of the line.
3. `## Comments` or `## Notes` (whichever fits) — any other comments and notes.

For fixes spanning multiple lines or files, repeat the `Add`/`Breakdown` pair once
per edit site (each header carries its own `<file>:<line>`), ordered in the sequence
they should be applied, then close with a single shared `## Notes` section.

Be concise: include all necessary information, but avoid filler words.

## Structure

GNU Stow–managed. Each top-level directory is a stow *package*; its inner layout
mirrors `$HOME`, so `stow <pkg>` symlinks the contents into place. Most packages
follow the `<pkg>/.config/...` (XDG) convention.

```
.
├── README.md          # Install/link instructions, cheat sheets, TODO, inspiration
├── alacritty/.config/alacritty/
│   ├── alacritty.toml         # Terminal config
│   └── themes/                # gruvbox, tokyo-night
├── git/.config/git/config
├── keyd/default.conf          # NOT stow-managed — symlinked to /etc/keyd/ manually
├── nvim/.config/nvim/         # Neovim, based on kickstart.nvim
│   ├── init.lua
│   └── lua/
│       ├── custom/plugins/    # User plugin additions
│       └── kickstart/plugins/ # Kickstart's bundled plugins
├── starship/.config/starship.toml
├── tmux/.config/tmux/tmux.conf
└── zsh/.config/zsh/
    ├── .zshenv                # Sets ZDOTDIR so the rest of zsh lives here
    ├── .zshrc
    ├── aliases.zsh
    ├── bindings.zsh
    ├── fzf.zsh
    ├── plugins.zsh            # Sources plugins/ (e.g. fast-syntax-highlighting)
    └── prompt.zsh
```

Linked with `stow alacritty git nvim starship tmux zsh` from the repo root.
`keyd` is excluded because the daemon only reads `/etc/keyd/` (see README).

