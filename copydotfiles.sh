#! /bin/bash

echo "Copy dotfiles? (y/v/f/*)"
echo "in vostok, write v. others, not work."
echo "Write f, and adapt FISH."
read g

#dfpath=$HOME/dotfiles          #Ubuntu
 dfpath=$HOME/develop/dotfiles  #Mac


case $g in
	"y" ) { cp ~/.vimrc $dfpath/.vimrc
		cp ~/.bash_profile $dfpath/.bash_profile
    cp ~/.SpaceVim.d/init.toml $dfpath/init.toml 
	};;
	"v" ) { cp ~/.vimrc ~/dotfiles/.vimrc_vos ~/vimrc
		ln -sf ~/dotfiles/.bash_profile ~/.bash_profile
	};;
  "f" ) { ln -sf $dfpath/config.fish ~/.config/fish/config.fish
    ln -sf $dfpath/.vimrc ~/.vimrc
    ln -sf $dfpath/init.toml  ~/.SpaceVim.d/init.toml
  };;
	* )	echo "stop"
esac

exit
