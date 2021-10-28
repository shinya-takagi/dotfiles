#!/bin/bash

# For Mac
if [ $(uname -s) = "Darwin" ]; then
    :
#   if [ -e $(brew) ]; then
#       brew install expect
#       brew install glow
#   fi

# For Linux
elif [ $(uname -s) = "Linux" ]; then
    :
#   sudo apt install expect
#   sudo apt install sshpass
#   git clone https://github.com/charmbracelet/glow.git ~/glow


fi
