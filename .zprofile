# zprofile

# Set PATH
if [ "$(uname -s)" = "Linux" ]; then
    export PATH="$HOME/.local/bin:$PATH"      # local binary path
    export PATH="/usr/local/go/bin:$PATH"     # go language path
    export PATH="/usr/local/texlive/2021/bin/x86_64-linux:$PATH"    # TeX Live
    export PYTHONPATH="$HOME/dev/Python/lib:$PYTHONPATH"    # Local Python library
    if [ -e /opt/intel/oneapi/setvars.sh ]; then
        source /opt/intel/oneapi/setvars.sh > /dev/null     # Intel Fortran/C++
    fi
    # dot manager
    export DOT_REPO="https://github.com/shinya-takagi/dotfiles.git"
    export DOT_DIR="$HOME/.dotfiles"
    # export PATH="$HOME/FISH:$PATH"
    # export PATH="$HOME/codes:$PATH"
    # export PATH="$HOME/.go/bin:$PATH"
    # export PATH="$HOME/intel/bin:$PATH"
    # export PATH="$HOME/.bin:$PATH"            # local binary path
    # export PATH="$HOME/go/bin:$PATH"
    #export PATH="$HOME/codes/GENERAL_CODE/GEF-2021-V1-1_linux:$PATH"
    #export PATH="$HOME/bin:$PATH"
elif [ "$(uname -s )" = "Darwin" ]; then
    export PATH="$HOME/FISH:$PATH"
    export PATH="$HOME/codes:$PATH"
    export PATH="$HOME/intel/bin:$PATH"
    export PATH="$HOME/bin:$PATH"
    export PATH="/usr/local/texlive/2021/bin/x86_64-linux:$PATH"
    export PATH="/usr/local/Cellar/bison/3.8.2/bin:$PATH"
    export PATH="$HOME/develop/wine/tools:$PATH"
    export PATH="$HOME/.wine/drive_c/windows/system32:$PATH"
    export PATH="$HOME/develop/fbc-1.06/bin:$PATH"
    #export PATH="$HOME/bin:$PATH"
    export PYTHONPATH="$HOME/Google_Drive_kindai.ac.jp/Python/lib:$PYTHONPATH"
    export PATH="/Applications/Wine Stable.app/Contents/Resources/wine/bin:$PATH"
    export FREETYPE_PROPERTIES="truetype:interpreter-version=35"
    export DYLD_FALLBACK_LIBRARY_PATH="/usr/lib:/opt/X11/lib:$DYLD_FALLBACK_LIBRARY_PATH"
fi
