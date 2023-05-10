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
#=============================

# OS Dependent
if [ "$(uname -s)" = "Linux" ]; then
    export PATH="/usr/local/go/bin:$PATH"     # go language path

    # Input method
    export GTK_IM_MODULE=fcitx5
    export QT_IM_MODULE=fcitx5
    export XMODIFIERS="@im=fcitx5"
    export XMODIFIER="@im=fcitx5"
    export DefaultIMModule=fcitx5
    if [ $SHLVL = 1 ] ; then
        (fcitx-autostart > /dev/null 2>&1 &)
        xset -r 49  > /dev/null 2>&1
    fi

elif [ "$(uname -s )" = "Darwin" ]; then
    export PATH="$HOME/intel/bin:$PATH"
    export PATH="/usr/local/texlive/2021/bin/x86_64-linux:$PATH"
    export PATH="/usr/local/Cellar/bison/3.8.2/bin:$PATH"
    export PATH="/Applications/Wine Stable.app/Contents/Resources/wine/bin:$PATH"
    export PATH="/usr/local/sbin:$PATH"
    export FREETYPE_PROPERTIES="truetype:interpreter-version=35"
    export DYLD_FALLBACK_LIBRARY_PATH="/usr/lib:/opt/X11/lib:$DYLD_FALLBACK_LIBRARY_PATH"

    # Git Credential Manager
    export GCM_CREDENTIAL_STORE=keychain

    # For git-sim
    [[ $(type git-sim) ]] && export git_sim_media_dir="$HOME/Desktop/"
fi
