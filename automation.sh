#! /bin/bash

echo "file upload or download? (u/d)"
read i

case $i in
#upload
"u" ) { git add .
	git commit -m "anything"
	git push -f origin master
	};;
#download
"d" ) {	git pull
	./dotfilesLink.sh
	};;
 *  ) echo "stop";;
esac

exit
