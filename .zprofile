# zprofile

# Set PATH

#========Commonly=============
## dot
export DOT_REPO="https://github.com/shinya-takagi/dotfiles_pub.git"
export DOT_DIR="$HOME/.dotfiles"

## Local binary
export PATH="$HOME/.local/bin:$PATH"

# Rust
export PATH="$HOME/.cargo/bin:$PATH"

# Starship
export STARSHIP_CONFIG="$HOME/.config/starship/starship.toml"
#=============================

# OS Dependent
if [ "$(uname -s)" = "Linux" ]; then
    # export PATH="/usr/local/go/bin:$PATH"     # go language path
    # export PATH="/usr/local/texlive/2021/bin/x86_64-linux:$PATH"

    # type pyenv > /dev/null 2>&1 && source $HOME/.pyenv/completions/pyenv.zsh

    # # Input method
    # export GTK_IM_MODULE=fcitx5
    # export QT_IM_MODULE=fcitx5
    # export XMODIFIERS="@im=fcitx5"
    # export XMODIFIER="@im=fcitx5"
    # export DefaultIMModule=fcitx5
    # if [ $SHLVL = 1 ] ; then
    #     (fcitx-autostart > /dev/null 2>&1 &)
    #     xset -r 49  > /dev/null 2>&1
    # fi


elif [ "$(uname -s )" = "Darwin" ]; then
    export PATH="$HOME/intel/bin:$PATH"
    export PATH="/usr/local/texlive/2023/bin/universal-darwin:$PATH"
    export PATH="/usr/local/Cellar/bison/3.8.2/bin:$PATH"
    export PATH="/Applications/Wine Stable.app/Contents/Resources/wine/bin:$PATH"
    export PATH="/Library/TeX/texbin:$PATH"
    export PATH="/usr/local/sbin:$PATH"
    export PATH="$HOME/.pyenv/versions/3.11.3/bin:$PATH"
    export PYTHONPATH="$HOME/dev/python/lib:$PYTHONPATH"
    export FREETYPE_PROPERTIES="truetype:interpreter-version=35"
    export DYLD_FALLBACK_LIBRARY_PATH="/usr/lib:/opt/X11/lib:$DYLD_FALLBACK_LIBRARY_PATH"

    # Git Credential Manager
    export GCM_CREDENTIAL_STORE=keychain

    # For git-sim
    type git-sim > /dev/null 2>&1 && export git_sim_media_dir="$HOME/Desktop/"

    # type keychain > /dev/null 2>&1 && eval $(keychain --eval --agents ssh $HOME/.ssh/id_ed25519d)
    if command -v keychain > /dev/null 2>&1; then
      keychain -q --nogui $HOME/.ssh/id_ed25519
      source $HOME/.keychain/$(hostname)-sh
    fi
    # type keychain > /dev/null 2>&1 && keychain -q --nogui $HOME/.ssh/id_ed25519d
fi

# Added by OrbStack: command-line tools and integration
source ~/.orbstack/shell/init.zsh 2>/dev/null || :
