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
#   npm install wsl-open

    COMMAND_LIST="test"

    ### Command exists or doesn't.
    for commands in $COMMAND_LIST
    do
        if type "$commands" > /dev/null 2>&1; then
            echo "command found"
        else
            echo "command not found"
        fi
    done



fi
