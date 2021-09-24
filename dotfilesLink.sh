#! /bin/bash
set -eux

echo "generate symboric link dotfiles? (y/*)"
echo "y -> copy files from own directories"
echo "Write others, not to copy or generate files.."
# echo "wsl is Windows subsystem for linux user"
# echo "in vostok, write v. others, not work."
read -r g
#---Discriminate OS---
#if [ "$(uname -s)" == 'Darwin' ]; then
#    OS='Mac'
#    DFPATH=$HOME/develop/dotfiles  #Mac
#elif [ "$(uname -s)" == 'Linux' ]; then
#    OS='Linux'
#    DFPATH=$HOME/dotfiles 
#elif [ "$(expr substr $(uname -s) 1 10)" == 'MINGW32_NT' ]; then                                                                                           
#    OS='Cygwin'
#else
#    echo "Your platform $(uname -a)) is not supported."
#    exit 1
#fi
#---------------------
# readonly solarize="dircolors.ansi-dark"
DFPATH=$(pwd)
readonly dir_sol=".dircolors-solarized"

case $g in
    "y" ) {
    readonly home_sol=$HOME/$dir_sol 
    readonly vim_path=$HOME/.vim
    mkdir -p ~/.zsh 
    mkdir -p "$vim_path"/ftplugin "$vim_path"/swap "$vim_path"/tmp "$vim_path"/undo
# - - - - -
    ln -sf "$DFPATH"/config.fish                ~/.config/fish/config.fish
    ln -sf "$DFPATH"/.vimrc                     ~/.vimrc
    ln -sf "$DFPATH"/.zshrc                     ~/.zshrc
    ln -sf "$DFPATH"/.zsh/alias.zsh 	        ~/.zsh/alias.zsh
    ln -sf "$DFPATH"/.tmux.conf 		        ~/.tmux.conf
    ln -sf "$DFPATH"/.vim/ftplugin/fortran.vim  "$vim_path"/ftplugin/fortran.vim
    ln -sf "$DFPATH"/.vim/ftplugin/sh.vim       "$vim_path"/ftplugin/sh.vim
    ln -sf "$DFPATH"/.vim/ftplugin/python.vim   "$vim_path"/ftplugin/python.vim
    ln -sf "$DFPATH"/.vim/ftplugin/zsh.vim      "$vim_path"/ftplugin/zsh.vim
# - - - - - 
    if [ ! -d "$home_sol" ]; then 
    	cp -r "$dir_sol"		                ~/.
    elif [ -n "$(ls -A "$home_sol")" ]; then
	    echo "$home_sol exists, so it cannot copy $dir_sol"
	    exit 1	
    fi
	};;
    * )	echo "stop"
esac

exit

