# Virtual environment

# Common environmental setting
## Rust
[[ -f "$HOME/.cargo/env" ]] && . "$HOME/.cargo/env"

## Python
export PYENV_ROOT="$HOME/.pyenv"          # pyenv path
export PATH="$PYENV_ROOT/bin:$PATH"       # For pyenv python path
if type pyenv > /dev/null 2>&1; then
  eval "$(pyenv init -)"
fi
export PYTHONUSERBASE="$HOME/.local"
# Rye
export PATH="$HOME/.rye/shims:$PATH"

# mise
if type mise > /dev/null 2>&1; then
  eval "$(mise activate zsh)"
fi

# OS Dependent
if [ "$(uname -s)" = "Linux" ]; then
    # Intel Fortran
    if [ -e /opt/intel/oneapi/setvars.sh ]; then
        source /opt/intel/oneapi/setvars.sh > /dev/null     # Intel Fortran/C++
    fi
elif [ "$(uname -s )" = "Darwin" ]; then
    # Intel Oneapi
    if [ -e /opt/intel/oneapi/setvars.sh ]; then
        source /opt/intel/oneapi/setvars.sh > /dev/null     # Intel Fortran/C++
    fi
    export LANG=ja_JP.UTF-8
fi
