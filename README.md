# README

dotfiles


# Get Started

1. Install Git and dot. To install dot, run codes below.

```bash
git clone https://github.com/ssh0/dot $HOME/.dot
```

2. Set Environmental variables.
```bash
export DOT_REPO="https://github.com/shinya-takagi/dotfiles_pub.git"
export DOT_DIR="$HOME/.dotfiles"
fpath=($HOME/dot $fpath)  # <- for completion
source $HOME/dot/dot.sh

```

3. Clone my repository.
```bash
dot clone && dot set -v
```
