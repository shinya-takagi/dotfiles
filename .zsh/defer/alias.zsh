# -----------------------------
# Alias
# -----------------------------
#
# Global alias (can set alias of pipeline)
abbr -S -g L="| less"
abbr -S -g H="| head"
abbr -S -g G="| grep"
abbr -S -g gr="| grep --color"
abbr -S -g GI="| grep -ri"

# local alias
abbr -S ls="ls --color=auto"
[[ $(type lsd) ]]; abbr -S ls="lsd"   # Use lsd instead of ls.
abbr -S lst="ls -ltr"
abbr -S la="ls -la"
abbr -S ll="ls -l"
abbr -S ltr="ls -lrt"
abbr -S lh="ls -lh"

abbr -S du="du -h"
abbr -S df="df -h"
abbr -S su="su -l"
abbr -S so="source"
abbr -S c="cd"
abbr -S cp="cp -i"
abbr -S rm="rm -i"
abbr -S rmf="rm -f"
abbr -S mkdir="mkdir -p"
abbr -S ..="c ../"
abbr -S back="pushd"
abbr -S diff="diff -U1"

if [ -e "$HOME/pass.sh" ]; then
  abbr -S sshp="sshpass -p $(sh ~/pass.sh) ssh"
fi

# from fish
#------Git------------
abbr -S gs="git status"
abbr -S ga="git add"
abbr -S gb="git branch"
abbr -S gco="git checkout"
abbr -S gcm="git commit -a -m"
abbr -S gp="git push"
abbr -S gpm="gp origin master"
abbr -S gf="git fetch"
abbr -S gm="git merge"

#----Docker----------
abbr -S dils="docker images"
abbr -S dcls="docker container ls"
abbr -S drun="docker run -it --name"
abbr -S drm="docker rm"
abbr -S drmi="docker rmi"
abbr -S dbu="docker build . -it"
abbr -S dpa="docker ps -a"

abbr -S et="exit"
abbr -S rl="readlink -f"
abbr -S dc="cd"
abbr -S sl="ls"

#-------URL--------------------------
#if type xdg-open >/dev/null 2>&1; then
#  abbr -S open="xdg-open"
#fi
#if type wsl-open >/dev/null 2>&1; then
if [[ "$(uname -r)" == *microsoft* ]];  then 
    abbr -S open="wsl-open"
    abbr -S xdg-open="wsl-open"
# Windows 
    abbr -S user="cd /mnt/c/Users/shiny"
    abbr -S cdrive="cd /mnt/c/Users/shiny"
    abbr -S checkos="cat /etc/os-release"
    abbr -S gefwin="cd /mnt/c/Users/shiny/mydata/miscellinous/GEF-2016-V1-2_edited"

fi
if type open >/dev/null 2>&1; then
    abbr -S ggr="open http://google.com/"
    abbr -S tube="open https://www.youtube.com"
    abbr -S github="open https://www.github.com"
    abbr -S twit="open https://www.twitter.com"
    abbr -S insta="open https://www.instagram.com"
    abbr -S qiita="open https://qiita.com"
fi

# Vim
abbr -S vi="vim"
abbr -S vr="vi ~/.vimrc"
abbr -S svr="source ~/.vimrc"
# Neovim
if type nvim > /dev/null 2>&1; then 
    abbr -S vi="nvim"   # Use neovim as vi
    abbr -S vni="nvim ~/.config/nvim/init.lua"
    abbr -S vnp="nvim ~/.config/nvim/lua/plugins.lua"
fi
# LunarVim https://github.com/LunarVim/LunarVim
[[ -a $HOME/.local/bin/lvim ]] && abbr -S vi="lvim"; abbr -S nv="nvim"

# tmux
#abbr -S tma="tmux attach"
#abbr -S tml="tmux list-window"

# zsh
abbr -S vz="vim ~/.zshrc"
abbr -S va="vi ~/.zsh/defer/alias.zsh"
abbr -S vz="vi ~/.zshrc"
abbr -S vp="vi ~/.zprofile"
abbr -S vl="vi ~/.zlogout"
abbr -S sz="source ~/.zshrc"
abbr -S sa="source ~/.zsh/defer/alias.zsh"
abbr -S vd="vi ~/.dircolors-solarized/dircolors.ansi-dark_taka"

# python
abbr -S py="python3"
abbr -S ytconfig="vim ~/.config/yt-dlp/config"

# TeX
abbr -S lmk="latexmk -pvc -output-directory=out"
abbr -S lmkc="latexmk -c"
abbr -S lmklua="latexmk -gg -pdflua -pvc -output-directory=out" 

# Clipboard
if [ -e /usr/bin/xsel ]; then
  abbr -S pbcopy='xsel --clipboard --input'
  abbr -S pbpaste='xsel --clipboard --output'
fi


#----- OS Distrbution condition ---------------------->
# TMPOS=$(cat /etc/os-release | head -2 | tail -1)
# PRETTY_NAME=${TMPOS:13}
# #---------For Arch Linux---------------->
# if [ $PRETTY_NAME == "Arch Linux\"" ]; then
#     alias al="echo Arch Linux"
#     alias pacman="sudo pacman"
#     alias pacmanupdate="sudo pacman -Sy"
#     alias vmemo="vim $HOME/dotfiles/tips/memo"
#     alias cmemo="cat $HOME/dotfiles/tips/memo"
#     alias nas="cd /mnt/nas"
# #---------Arch Linux--------<
# #---------For Ubuntu-------------------->
# elif [ $PRETTY_NAME == "Ubuntu\"" ]; then
#     alias al="echo Ubuntu"
# fi
#---------Ubuntu--------<
# unset TMPOS PRETTY_NAME
#---- Condition -------------<

#-------------------------------
#	FUNCTION
#-------------------------------
# fbr - checkout git branch
fbr() {
  local branches branch
  branches=$(git branch -vv) &&
  branch=$(echo "$branches" | fzf +m) &&
  git checkout $(echo "$branch" | awk '{print $1}' | sed "s/.* //")
}
# fbr - checkout git branch (including remote branches)
fbrm() {
  local branches branch
  branches=$(git branch --all | grep -v HEAD) &&
  branch=$(echo "$branches" |
           fzf-tmux -d $(( 2 + $(wc -l <<< "$branches") )) +m) &&
  git checkout $(echo "$branch" | sed "s/.* //" | sed "s#remotes/[^/]*/##")
}
# fshow - git commit browser
fshow() {
  git log --graph --color=always \
      --format="%C(auto)%h%d %s %C(black)%C(bold)%cr" "$@" |
  fzf --ansi --no-sort --reverse --tiebreak=index --bind=ctrl-s:toggle-sort \
      --bind "ctrl-m:execute:
                (grep -o '[a-f0-9]\{7\}' | head -1 |
                xargs -I % sh -c 'git show --color=always % | less -R') << 'FZF-EOF'
                {}
FZF-EOF"
}
# fd - cd to selected directory
fd() {
  local dir
  dir=$(find ${1:-.} -path '*/\.*' -prune \
                  -o -type d -print 2> /dev/null | fzf +m) &&
  cd "$dir"
}

vimtime() {
    if type nvim > /dev/null 2>&1; then
        nvim --startuptime ~/nvim.log +q
    fi
}
vimconf(){
    local nvim_path="$HOME/.config/nvim"
    if type nvim > /dev/null 2>&1; then
        nvim $nvim_path/lua/plugins.lua
    fi
}

