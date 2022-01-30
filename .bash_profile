# .bash_profile

# Get the aliases and functions
if [ -f ~/.bashrc ]; then
	. ~/.bashrc
fi

# User specific environment and startup programs
# User specific aliases and functions
. /opt/intel/bin/compilervars.sh intel64
PATH=/opt/bin:/opt/openmpi/bin:$PATH
LD_LIBRARY_PATH=/opt/openmpi/lib:$LD_LIBRARY_PATH
MANPATH=/opt/openmpi/share/man:$MANPATH
export PATH LD_LIBRARY_PATH MANPATH
ulimit -s unlimited

#PATH=$PATH:$HOME/bin
#PATH="$HOME/usr/bin:$PATH"
PATH="$HOME/own/code:$PATH"
PATH="$HOME/local/bin:$PATH"
export PYTHONPATH="$HOME/python_dev/lib"

export PATH


