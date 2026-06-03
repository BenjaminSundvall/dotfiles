# Dotfiles

## Working agreement

- **Propose edits with the Edit tool.** It surfaces a native diff in the permission
  prompt, which is the preferred way to show a change.
- The user decides each edit: accept it, reject and apply it by hand (sometimes
  modified), or reject and skip. Don't assume which, and never tell the user to reject.
- Answer questions and propose solutions; the user is the one who commits the change.
- **Record preferences here, not in global memory.** Any working/formatting
  preference goes in this file unless the user explicitly says to use global memory.

## Answer formatting

When proposing a change, format the answer in this order, using a header for each
section:
1. `## Comments` or `## Notes` (whichever fits) — caveats, alternatives, context.
   First, so it is on screen when the edit prompt appears.
2. `## Breakdown` — a list explaining each argument/part of the change.
3. The edit itself, via the Edit tool. (If shown as text instead, use a
   `## Replace/Add to <file>:<line>` header with a code block.)

For fixes spanning multiple sites, repeat the Notes/Breakdown/edit sequence once per
site, ordered in the sequence they should be applied.

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

