#! /bin/bash

function main() {
    local message="Fix dotfilesLink.sh for all OS"
    local i branch_name

    echo "File upload or download? (u/d/*)"
    echo "If you want to stop this, put any word except 'u' and 'd'."
    read i
    
    if [ $(uname -s) == 'Darwin' ]; then
        branch_name='mac'
    elif [ $(uname -s) == 'Linux' ]; then
    #   branch_name='notepc1'
    #   branch_name='mainpc1'
        branch_name='vostok'
    fi
    
    case $i in
    # - - - - upload - - - -
     "u" )  git commit -a
    #       git push origin master
            git push origin "$branch_name"
      ;; 
    # - - - - download - - - -
    "d" )   git pull
#           ./dotfilesLink.sh
    	;;
     *  ) echo "stop";;
    esac
}

main
