#! /bin/bash

echo "Copy dotfiles? (y/v/wsl/*)"
echo "y -> copy files from own directories"
echo "wsl is Windows Subsystem for Linux user."
echo "in vostok, write v. others, not work."
echo "Write f, and adapt FISH."
read g

#---Discriminate OS---
#if [ "$(uname)" == 'Darwin' ]; then
#   OS='Mac'
#   dfpath=$HOME/develop/dotfiles  #Mac
#elif [ "$(expr substr $(uname -s) 1 5)" == 'Linux' ]; then
#   OS='Linux'
#   dfpath=$HOME/dotfiles  #Mac
#elif [ "$(expr substr $(uname -s) 1 10)" == 'MINGW32_NT' ]; then                                                                                           
#   OS='Cygwin'
#else
#   echo "Your platform ($(uname -a)) is not supported."
#   exit 1
#fi
#---------------------

 dfpath=$HOME/dotfiles          #Ubuntu
 echo $dfpath

case $g in
	"y" ) { 
#   cp ~/.vimrc $dfpath/.vimrc
#		cp ~/.bash_profile $dfpath/.bash_profile
#   cp ~/.SpaceVim.d/init.toml $dfpath/init.toml 
    \cp ~/.config/fish/config.fish $dfpath/config.fish
	};;
	"v" ) { cp ~/.vimrc ~/dotfiles/.vimrc_vos ~/vimrc
		ln -sf ~/dotfiles/.bash_profile ~/.bash_profile
	};;
  "wsl" ) { ln -sf $dfpath/config.fish ~/.config/fish/config.fish
#   ln -sf $dfpath/.vimrc ~/.vimrc
    ln -sf $dfpath/.zshrc ~/.zshrc
    ln -sf $dfpath/init.toml  ~/.SpaceVim.d/init.toml
  };;
	* )	echo "stop"
esac

exit
