#! /bin/bash

echo "file upload or download? (u/d)"
read i

 readonly branch_name="notepc1"
 readonly message="Fix dotfilesLink.sh for all OS"

case $i in
#upload
#"u" ) {# git add .
 "u" )  git commit -a -m "$message"
    #   git push -u origin master
    #   git push
        git push origin "$branch_name"
  ;; 
#download
"d" ) 	git pull
	./dotfilesLink.sh
	;;
 *  ) echo "stop";;
esac

exit
