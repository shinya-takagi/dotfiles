# Virtual environment

#
if [ "$(uname -s)" = "Linux" ]; then
    # Pyenv
    export PYENV_ROOT="$HOME/.pyenv"          # pyenv path
    export PATH="$PYENV_ROOT/bin:$PATH"       # For pyenv python path
    export PYTHONUSERBASE="$HOME/.local"
    if type pyenv > /dev/null 2>&1; then
      eval "$(pyenv init -)"
    fi
    # Intel Fortran
    if [ -e /opt/intel/oneapi/setvars.sh ]; then
        source /opt/intel/oneapi/setvars.sh > /dev/null     # Intel Fortran/C++
    fi
elif [ "$(uname -s )" = "Darwin" ]; then
    # Python local Path
    export PYENV_ROOT="$HOME/.pyenv"          # pyenv path
    export PATH="$PYENV_ROOT/bin:$PATH"       # For pyenv python path
    export PYTHONUSERBASE="$HOME/.local"
    if type pyenv > /dev/null 2>&1; then
      eval "$(pyenv init -)"
    fi
    # Intel Oneapi
    if [ -e /opt/intel/oneapi/setvars.sh ]; then
        source /opt/intel/oneapi/setvars.sh > /dev/null     # Intel Fortran/C++
    fi
fi
