#!/bin/bash

# For Mac
if [ $(uname -s) == "Darwin" ]; then
    :
#   if [ -e $(brew) ]; then
#       brew install expect
#   fi
# For Linux
elif [ $(uname -s) == "Linux" ]; then
    :
#   sudo apt install expect

fi
