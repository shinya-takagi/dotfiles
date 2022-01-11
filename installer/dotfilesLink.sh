#! /bin/bash
set -eu


function usage(){
        echo "Usage: $0 [-r] [-h] " 1>&2
        echo "     : r -> Run generation of links in dotfiles"
        echo "     : h -> Show help. (This message)"
        exit 1
}

function maintest(){
    echo testnow
}

function main(){
    local g OS
#   echo "generate symboric link dotfiles? (y/*)"
#   echo "y -> copy files from own directories"
#   echo "Write others, not to copy or generate files."
#   read -r g
# ---Discriminate OS----->
    if [ "$(uname -s)" == 'Darwin' ]; then
         OS='Mac'
    elif [ "$(uname -s)" == 'Linux' ]; then
         OS='Linux'
    fi
# --OS-------------------<
    local DFPATH=$(pwd)
    readonly dir_sol=".dircolors-solarized" 

#   case $g in
#       "y" ) {
        local home_sol=$HOME/$dir_sol 
        local vim_path=$HOME/.vim
        mkdir -p ~/.zsh 
        mkdir -p "$vim_path"/ftplugin "$vim_path"/swap "$vim_path"/tmp "$vim_path"/undo "$vim_path"/colors "$vim_path"/after/syntax
        mkdir -p ~/.config/fish ~/.config/yt-dlp
# - symboric link - -
        ln -sf "$DFPATH"/config.fish                    ~/.config/fish/config.fish
        ln -sf "$DFPATH"/.tmux.conf                     ~/.tmux.conf
        # Vim
        ln -sf "$DFPATH"/.vim/ftplugin/fortran.vim      "$vim_path"/ftplugin/fortran.vim
        ln -sf "$DFPATH"/.vim/ftplugin/sh.vim           "$vim_path"/ftplugin/sh.vim
        ln -sf "$DFPATH"/.vim/ftplugin/python.vim       "$vim_path"/ftplugin/python.vim
        ln -sf "$DFPATH"/.vim/ftplugin/zsh.vim          "$vim_path"/ftplugin/zsh.vim
        ln -sf "$DFPATH"/.vim/colors/ThemerVim.vim      "$vim_path"/colors/ThemerVim.vim
        ln -sf "$DFPATH"/.vim/after/syntax/python.vim   "$vim_path"/after/syntax/python.vim
        ln -sf "$DFPATH"/.gvimrc                        ~/.gvimrc
        ln -sf "$DFPATH"/.vim/coc-settings.json           "$vim_path"/coc-settings.json
        # Bash
        ln -sf "$DFPATH"/.bashrc                        ~/.bashrc
        ln -sf "$DFPATH"/.bash_profile                  ~/.bash_profile
        ln -sf "$DFPATH"/.bash_logout                   ~/.bash_logout
        ln -sf "$DFPATH"/.bash_prompt.sh                ~/.bash_prompt.sh
        # Git
        ln -sf "$DFPATH"/.git-prompt.sh                 ~/.git-prompt.sh
        ln -sf "$DFPATH"/.git-completion.bash           ~/.git-completion.bash
        ln -sf "$DFPATH"/.gitconfig                     ~/.gitconfig
        # latex files
        ln -sf "$DFPATH"/.latexmkrc                     ~/.latexmkrc
        # Others
        ln -sf "$DFPATH"/.config/yt-dlp/config          ~/.config/yt-dlp/config

        # -----Color scheem------
        if [ ! -d "$home_sol" ]; then 
            cp -r "$dir_sol"                            ~/.
            case "$OS" in
                'Mac' ) { ln -sf "$DFPATH"/"$dir_sol"/"dircolors.ansi-dark_taka_mac" ~/"$dir_sol"/"dircolors.ansi-dark_taka"
                } ;;
                'Linux' ) { ln -sf "$DFPATH"/"$dir_sol"/"dircolors.ansi-dark_taka" ~/"$dir_sol"/"dircolors.ansi-dark_taka" 
                };;
            esac
        elif [ -n "$(ls -A "$home_sol")" ]; then
            echo "$home_sol exists, so it cannot copy $dir_sol"
            case "$OS" in
                'Mac' ) { ln -sf "$DFPATH"/"$dir_sol"/"dircolors.ansi-dark_taka_mac" ~/"$dir_sol"/"dircolors.ansi-dark_taka"
                } ;;
                'Linux' ) { ln -sf "$DFPATH"/"$dir_sol"/"dircolors.ansi-dark_taka" ~/"$dir_sol"/"dircolors.ansi-dark_taka" 
                };;
            esac
        fi
        # ------------------------

        ln -sf "$DFPATH"/.zsh/alias_mac.zsh             ~/.zshenv
        case "$OS" in
            'Mac'  ) {  
                ln -sf "$DFPATH"/.vimrc_mac             ~/.vimrc
                ln -sf "$DFPATH"/.zshrc_mac             ~/.zshrc 
                ln -sf "$DFPATH"/.zprofile              ~/.zprofile
                ln -sf "$DFPATH"/.zsh/alias_mac.zsh     ~/.zsh/alias.zsh
                ln -sf "$DFPATH"/.gallery-dl_mac.json   ~/.gallery-dl.conf
            };; 
            'Linux' ){  
                local zfuncs=".zsh/functions"
                mkdir -p $HOME/$zfuncs 
                ln -sf "$DFPATH"/.vimrc                 ~/.vimrc
                ln -sf "$DFPATH"/.zlogout               ~/.zlogout
                ln -sf "$DFPATH"/.zprofile              ~/.zprofile
                ln -sf "$DFPATH"/.zshrc                 ~/.zshrc
                ln -sf "$DFPATH"/.zsh/alias.zsh         ~/.zsh/alias.zsh
                ln -sf "$DFPATH"/$zfuncs/_mcf           ~/$zfuncs/_mcf
                ln -sf "$DFPATH"/$zfuncs/_cht           ~/$zfuncs/_cht
                ln -sf "$DFPATH"/.gallery-dl.json       ~/.gallery-dl.conf
            };;
            * )	echo "stop"
        esac
#       };;
#   esac
# - - - - - - - - - 
    exit
}

while getopts :hr OPT
do
    case "$OPT" in
        r) main
            ;;
        h) usage
            ;;
        \?) usage
            ;;
#       *) 
#           ;;
    esac
done

