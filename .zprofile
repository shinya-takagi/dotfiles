# zprofile

# Set PATH
if [ "$(uname -s)" = "Linux" ]; then
    export PATH="$HOME/.local/bin:$PATH"      # local binary path
    export PATH="/usr/local/go/bin:$PATH"     # go language path
    export PYENV_ROOT="$HOME/.pyenv"          # pyenv path
    export PATH="$PYENV_ROOT/bin:$PATH"       # For pyenv python path
    export PYTHONUSERBASE="$HOME/.local"
    if type pyenv > /dev/null 2>&1; then
      eval "$(pyenv init -)"
    fi
    if [ -e /opt/intel/oneapi/setvars.sh ]; then
        source /opt/intel/oneapi/setvars.sh > /dev/null     # Intel Fortran/C++
    fi
    # dot manager
    export DOT_REPO="https://github.com/shinya-takagi/dotfiles_pub.git"
    export DOT_DIR="$HOME/.dotfiles"
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
    export PATH="$HOME/codes:$PATH"
    export PATH="$HOME/intel/bin:$PATH"
    export PATH="$HOME/.local/bin:$PATH"
    export PATH="/usr/local/texlive/2021/bin/x86_64-linux:$PATH"
    export PATH="/usr/local/Cellar/bison/3.8.2/bin:$PATH"
    export PATH="$HOME/develop/wine/tools:$PATH"
    export PATH="/Applications/Wine Stable.app/Contents/Resources/wine/bin:$PATH"
    export FREETYPE_PROPERTIES="truetype:interpreter-version=35"
    export DYLD_FALLBACK_LIBRARY_PATH="/usr/lib:/opt/X11/lib:$DYLD_FALLBACK_LIBRARY_PATH"

    # Python local Path
    export PYTHONUSERBASE="$HOME/.local"

    # dot manager
    export DOT_REPO="https://github.com/shinya-takagi/dotfiles_pub.git"
    export DOT_DIR="$HOME/.dotfiles"
    # Intel Oneapi
    if [ -e /opt/intel/oneapi/setvars.sh ]; then
        source /opt/intel/oneapi/setvars.sh > /dev/null     # Intel Fortran/C++
    fi
fi
