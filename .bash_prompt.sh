#!/bin/bash

# ---TEST PRONPT------->
#export PS1="[Now] \\t at \\d\\n[ \\w]\\n \$ "
#export PS1="[ \\w]\\n \$ "
#export PS1="\033[01;34m \\w\\n\033[00m $ "
source ~/.git-prompt.sh
export PS1="\[\033[01;34m\] \w $(__git_ps1 "(%s)")\n\[\033[00m\] $ "

