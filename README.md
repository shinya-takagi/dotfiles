# dotfiles

This repository is my dotfiles based on [dot](https://github.com/ssh0/dot).


# Environment

- OS: MacOSX or Linux(WSL)
- shell: zsh
  - plugin manager: [sheldon](https://github.com/rossmacarthur/sheldon.git)
- editor : neovim
  - plugin manager: [Lazy.nvim](https://github.com/folke/lazy.nvim.git)
  - plugins: [LazyVim](https://github.com/LazyVim/LazyVim.git)
- terminal: alacritty
- Launcher: Raycast(MacOS Only)
- version manager: Git
- dotfile manager: [dot](https://github.com/ssh0/dot)


# Get Started

1. Install Git and dot. To install dot, run codes below.

```bash
git clone https://github.com/ssh0/dot $HOME/.dot
```

2. Set Environmental variables.
```bash
export DOT_REPO="https://github.com/shinya-takagi/dotfiles.git"
export DOT_DIR="$HOME/.dotfiles"
fpath=($HOME/.dot $fpath)  # <- for completion
source $HOME/.dot/dot.sh

```

3. Clone my repository.
```bash
dot clone && dot set -v
```


# Configuration

- dotlink - symbolic link configuration for dotfiles depending on OS.
- dotrc - dot configuration. See [dot](https://github.com/ssh0/dot).
- and more.
