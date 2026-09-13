# zprofile

#========Common=============
## dot
export DOT_REPO="https://github.com/shinya-takagi/dotfiles_pub.git"
export DOT_DIR="$HOME/.dotfiles"

## Local binary
export PATH="$HOME/.local/bin:$PATH"

# Julia
export PATH="$HOME/.juliaup/bin:$PATH"
[ -f "$HOME/.julia/juliaup/completions/zsh.zsh" ] && source "$HOME/.julia/juliaup/completions/zsh.zsh"

# LMstudio
export PATH="$PATH:$HOME/.lmstudio/bin"

# OpenCode
export PATH=/home/shinya/.opencode/bin:$PATH

# Starship
export STARSHIP_CONFIG="$HOME/.config/starship/starship.toml"
#=============================
ulimit -s unlimited
ulimit -n 65535

if [ -f "$HOME/.zshrc_local" ]; then
  source $HOME/.zshrc_local
fi

if [ -f "$HOME/.local/bin/env" ]; then
  source "$HOME/.local/bin/env"
fi

# Rust
if [ -f "$HOME/.cargo/env" ]; then
  . "$HOME/.cargo/env"
fi

# Intel OneAPI
source /opt/intel/oneapi/setvars.sh > /dev/null 2>&1 || :

# OS Dependent
if [ "$(uname -s)" = "Linux" ]; then
    export PYTHONPATH="$HOME/research/plot_shape:$PYTHONPATH"

    if type keychain > /dev/null 2>&1; then
      keychain -q --nogui $HOME/.ssh/id_ed25519
      source $HOME/.keychain/$HOST-sh
    fi
    export GTK_IM_MODULE=ibus
    export TERM=xterm-256color

    # NVIDIA HPC Kit
    export NVHPC=/opt/nvidia/hpc_sdk
    export PATH=$NVHPC/Linux_x86_64/26.3/compilers/bin:$PATH
    export MANPATH=$MANPATH:$NVHPC/Linux_x86_64/26.3/compilers/man
    # For cupti
    export LD_LIBRARY_PATH=/opt/nvidia/hpc_sdk/Linux_x86_64/26.3/cuda/13.1/extras/CUPTI/lib64:$LD_LIBRARY_PATH

elif [ "$(uname -s )" = "Darwin" ]; then
    # Git Credential Manager
    export GCM_CREDENTIAL_STORE=keychain

    # zsh-autosuggetions
    ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=#888888"

    # Added by OrbStack: command-line tools and integration
    type orbstack > /dev/null 2>&1 && source ~/.orbstack/shell/init.zsh 2>/dev/null

    # type keychain > /dev/null 2>&1 && eval $(keychain --eval --agents ssh $HOME/.ssh/id_ed25519d)
    if command -v keychain > /dev/null 2>&1; then
      keychain -q --nogui $HOME/.ssh/id_ed25519
      source $HOME/.keychain/$(hostname)-sh
    fi

    # Homebrew for Apple silicon processor
    eval "$(/opt/homebrew/bin/brew shellenv zsh)"
fi

