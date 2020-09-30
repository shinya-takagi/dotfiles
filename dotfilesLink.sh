#! /bin/bash

echo "generate readlink dotfiles? (y/v/*)"
echo "in vostok, write v. others, not work."
read g

case $g in
	"y" ) { ln -sf ~/dotfiles/.vimrc ~/.vimrc
		ln -sf ~/dotfiles/.bash_profile ~/.bash_profile
	};;
	"v" ) { ln -sf ~/dotfiles/.vimrc_vos ~/vimrc
		ln -sf ~/dotfiles/.bash_profile ~/.bash_profile
	};;
	* )	echo "stop"
esac

exit

