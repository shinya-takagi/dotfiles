#! /bin/bash

echo "generate symboric link dotfiles? (y/v/wsl/*)"
echo "y -> copy files from own directories"
echo "wsl is Windows subsystem for linux user"
echo "in vostok, write v. others, not work."
read g
#---Discriminate OS---
#if [ "$(uname)" == 'Darwin' ]; then
#    OS='Mac'
#    dfpath=$HOME/develop/dotfiles  #Mac
#elif [ "$(expr substr $(uname -s) 1 5)" == 'Linux' ]; then
#    OS='Linux'
     dfpath=$HOME/dotfiles  #Mac
#elif [ "$(expr substr $(uname -s) 1 10)" == 'MINGW32_NT' ]; then                                                                                           
#    OS='Cygwin'
#else
#    echo "Your platform ($(uname -a)) is not supported."
#    exit 1
#fi
#---------------------

case $g in
	"y" ) {
#   ln -sf $dfpath/.vimrc        ~/.vimrc
#   ln -sf $dfpath/.bash_profile ~/.bash_profile
    ln -sf $dfpath/init.toml     ~/.SpaceVim.d/init.toml
    ln -sf $dfpath/config.fish   ~/.config/fish/config.fish
	};;
	"v" ) { 
    ln -sf $dfpath/.vimrc_vos ~/vimrc
    ln -sf $dfpath/.bash_profile ~/.bash_profile
	};;
  "wsl" ) { 
    ln -sf $dfpath/config.fish ~/.config/fish/config.fish
    ln -sf $dfpath/.vimrc ~/.vimrc
    ln -sf $dfpath/.zshrc ~/.zshrc
  };;
	* )	echo "stop"
esac

exit

