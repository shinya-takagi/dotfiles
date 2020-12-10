#! /bin/bash

echo "Copy dotfiles? (y/v/f/*)"
echo "in vostok, write v. others, not work."
echo "Write f, and adapt FISH."
read g

case $g in
	"y" ) { cp ~/.vimrc ~/dotfiles/.vimrc
		cp ~/.bash_profile ~/dotfiles/.bash_profile
	};;
	"v" ) { cp ~/.vimrc ~/dotfiles/.vimrc_vos ~/vimrc
		ln -sf ~/dotfiles/.bash_profile ~/.bash_profile
	};;
  "f" ) { ln -sf ~/dotfiles/config.fish ~/.config/fish/config.fish
    ln -sf ~/dotfiles/.vimrc ~/.vimrc
  };;
	* )	echo "stop"
esac

exit
