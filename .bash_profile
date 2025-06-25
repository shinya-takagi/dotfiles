# .bash_profile

# Get the aliases and functions
if [ -f ~/.bashrc ]; then
  . ~/.bashrc
fi

# User specific environment and startup programs
# User specific aliases and functions
#. /opt/intel/bin/compilervars.sh intel64
PATH=/opt/bin:/opt/openmpi/bin:$PATH
LD_LIBRARY_PATH=/opt/openmpi/lib:$LD_LIBRARY_PATH
MANPATH=/opt/openmpi/share/man:$MANPATH
export PATH LD_LIBRARY_PATH MANPATH
ulimit -s unlimited
# Change Directory Colors
# eval `dircolors $HOME/.dircolors-solarized/dircolors.ansi-dark_taka`
eval $(dircolors $HOME/.dircolors)

source ~/.bash_aliases

# ----------------------------------
# Slurm
export JOBSCRIPT=$HOME/own/code/batch_job

#----------------PATH---------------------->
# Add current workking directory to PATH
PATH=.:$PATH
#PATH=$PATH:$HOME/bin
#PATH="$HOME/usr/bin:$PATH"
PATH="$HOME/own/code:$PATH"
PATH="$HOME/.local/bin:$PATH"
# PATH="$HOME/local/usr/local/bin:$PATH"

export PYTHONPATH="$HOME/python_dev/lib"
export PATH

# #---------------------------------<
# # Generate log
# if [ ! -d "$HOME/.logfiles" ]; then
#     mkdir -p "$HOME/.logfiles"
# fi
# # Only collect connection log while ssh.
# NOW_PROCESS=$(ps aux | grep $PPID | grep sshd |  awk '{ print $11 }')
# if [ $NOW_PROCESS = sshd: ]; then
#     script -af "$HOME/.logfiles/$(date +%Y%m%d.log)"
# fi

#=====================================================
# colors define
#-----------------------------------------------------
C_RESET=$'\e[0m'
C_RED=$'\e[31m'
C_GREEN=$'\e[32m'
C_YELLOW=$'\e[33m'
C_BLUE=$'\e[34m'
C_MAGENTA=$'\e[35m'
C_CYAN=$'\e[36m'
C_IRED=$'\e[1;37;41m'
C_IGREEN=$'\e[1;30;42m'
C_IYELLOW=$'\e[1;30;43m'
C_IBLUE=$'\e[1;37;44m'
C_IMAGENTA=$'\e[1;37;45m'
C_ICYAN=$'\e[1;30;46m'
C_IWHITE=$'\e[1;30;47m'

#=====================================================
# tmux
#-----------------------------------------------------
alias TL="tmux ls"

function T() {
  if [ "$1" ]; then
    tmux a -t $1 || tmux -u new -s $1
  else
    TMUX_COUNT=$(tmux ls 2>/dev/null | wc -l)
    if [ ${TMUX_COUNT} -ge 2 ]; then
      tmux ls
    else
      tmux a || tmux -u
    fi
  fi
}
TMUX_PS=$(pgrep tmux)
if [ "${TMUX_PS}" ]; then
  if [ ! "${TMUX}" ]; then
    echo "? ${C_GREEN}tmux is running. type ${C_RESET}${C_IGREEN} T ${C_RESET}${C_GREEN} to attach.${C_RESET}"
    tmux ls
    # else already in tmux
  fi
  # else
  # echo "tmux is not running."
fi

# export PATH="$HOME/homebrew/bin:$PATH"
eval $(~/.linuxbrew/bin/brew shellenv)
