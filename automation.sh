#! /bin/bash

function main() {

    echo "file upload or download? (u/d)"
    read i
    
    if [ $(uname -s) == 'Darwin' ]; then
        local branch_name='mac'
    elif [ $(uname -s) == 'Linux' ]; then
        local branch_name='notepc1'
    #   branch_name='mainpc1'
    fi
    local message="Fix dotfilesLink.sh for all OS"
    
    case $i in
    # - - - - upload - - - -
     "u" )  git commit -a -m "$message"
            git push origin master
    #       git push origin "$branch_name"
      ;; 
    # - - - - download - - - -
    "d" ) 	git pull
    	./dotfilesLink.sh
    	;;
     *  ) echo "stop";;
    esac
}

main
