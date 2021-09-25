#! /bin/bash
set -eu

function main(){
    echo "generate symboric link dotfiles? (y/*)"
    echo "y -> copy files from own directories"
    echo "Write others, not to copy or generate files."
    read -r g
# ---Discriminate OS----->
    if [ "$(uname -s)" == 'Darwin' ]; then
         OS='Mac'
    elif [ "$(uname -s)" == 'Linux' ]; then
         OS='Linux'
    fi
# --OS-------------------<
    local DFPATH=$(pwd)
    readonly dir_sol=".dircolors-solarized"
    
    case $g in
        "y" ) {
        readonly home_sol=$HOME/$dir_sol 
        readonly vim_path=$HOME/.vim
        mkdir -p ~/.zsh 
        mkdir -p "$vim_path"/ftplugin "$vim_path"/swap "$vim_path"/tmp "$vim_path"/undo
# - - - - - - - - - -
        ln -sf "$DFPATH"/config.fish                    ~/.config/fish/config.fish
        ln -sf "$DFPATH"/.vimrc                         ~/.vimrc
        case "$OS" in
            'Mac'  ) {  ln -sf "$DFPATH"/.zshrc_mac        ~/.zshrc 
                        ln -sf "$DFPATH"/.zsh/alias_mac.zsh ~/.zsh/alias.zsh
            };; 
            'Linux' ){  ln -sf "$DFPATH"/.zshrc            ~/.zshrc
                        ln -sf "$DFPATH"/.zsh/alias.zsh    ~/.zsh/alias.zsh
                    };;
        esac
        ln -sf "$DFPATH"/.tmux.conf                     ~/.tmux.conf
        ln -sf "$DFPATH"/.vim/ftplugin/fortran.vim      "$vim_path"/ftplugin/fortran.vim
        ln -sf "$DFPATH"/.vim/ftplugin/sh.vim           "$vim_path"/ftplugin/sh.vim
        ln -sf "$DFPATH"/.vim/ftplugin/python.vim       "$vim_path"/ftplugin/python.vim
        ln -sf "$DFPATH"/.vim/ftplugin/zsh.vim          "$vim_path"/ftplugin/zsh.vim
# - - - - - - - - - 
        if [ ! -d "$home_sol" ]; then 
            cp -r "$dir_sol"                        ~/.
        elif [ -n "$(ls -A "$home_sol")" ]; then
    	    echo "$home_sol exists, so it cannot copy $dir_sol"
        fi
    	};;
        * )	echo "stop"
    esac
}

main
