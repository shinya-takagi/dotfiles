#! /bin/bash

echo "file upload or download? (u/d)"
read i

#message="update dotfiles."
 message="add zsh files."

case $i in
#upload
#"u" ) {# git add .
 "u" ) git commit -a -m "$message"
#git push -u origin master
  git push
  ;; 
#download
"d" ) 	git pull
	./dotfilesLink.sh
	;;
 *  ) echo "stop";;
esac

exit
