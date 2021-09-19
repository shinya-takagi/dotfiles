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
#elif [ "$(expr $(uname -s)" == 'Linux' ]; then
#    OS='Linux'
#elif [ "$(expr substr $(uname -s) 1 10)" == 'MINGW32_NT' ]; then                                                                                           
#    OS='Cygwin'
#else
#    echo "Your platform ($(uname -a)) is not supported."
#    exit 1
#fi
#---------------------
readonly dfpath=$HOME/dotfiles 
readonly solarize="dircolors.ansi-dark"
readonly dir_sol=".dircolors-solarized"

case $g in
    "y" ) {
#   ln -sf $dfpath/.vimrc        ~/.vimrc
#   ln -sf $dfpath/.bash_profile ~/.bash_profile
    ln -sf $dfpath/init.toml     ~/.SpaceVim.d/init.toml
    ln -sf $dfpath/config.fish   ~/.config/fish/config.fish
	};;
    "v" ) { 
    ln -sf $dfpath/.vimrc_vos ~/.vimrc
    ln -sf $dfpath/.bash_profile ~/.bash_profile
	};;
    "wsl" ) { 
    readonly home_sol=$HOME/$dir_sol 
    mkdir -p ~/.zsh 
# - - - - -
    ln -sf $dfpath/config.fish 		~/.config/fish/config.fish
    ln -sf $dfpath/.vimrc 		~/.vimrc
    ln -sf $dfpath/.zshrc 		~/.zshrc
    ln -sf $dfpath/.zsh/alias.zsh 	~/.zsh/alias.zsh
    ln -sf $dfpath/.tmux.conf 		~/.tmux.conf
# - - - - - 
    if [ ! -d $home_sol ]; then 
    	cp -r  $dir_sol			~/.
    elif [ -n "$(ls -A $home_sol)" ]; then
	echo "$home_sol exists, so it cannot copy $dir_sol"
	exit 1	
    fi
};;
    * )	echo "stop"
esac

exit

