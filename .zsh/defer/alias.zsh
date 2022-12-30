# -----------------------------
# Alias
# -----------------------------
#
# Global alias (can set alias of pipeline)
alias -g L="| less"
alias -g H="| head"
alias -g G="| grep"
alias -g gr="| grep --color"
alias -g GI="| grep -ri"

# local alias
alias ls="ls --color=auto"
[[ $(type lsd) ]]; alias ls="lsd"   # Use lsd instead of ls.
alias lst="ls -ltr"
alias la="ls -la"
alias ll="ls -l"
alias ltr="ls -lrt"
alias lh="ls -lh"

alias du="du -h"
alias df="df -h"
alias su="su -l"
alias so="source"
alias c="cd"
alias cp="cp -i"
alias rm="rm -i"
alias rmf="rm -f"
alias mkdir="mkdir -p"
alias ..="c ../"
alias back="pushd"
alias diff="diff -U1"

#------Git------------
alias gs="git status"
alias ga="git add"
alias gb="git branch"
alias gco="git checkout"
alias gcm="git commit -a -m"
alias gp="git push"
alias gpm="gp -u origin master"
alias gf="git fetch"
alias gm="git merge"

#----Docker----------
alias dils="docker images"
alias dcls="docker container ls"
alias drun="docker run -it --name"
alias drm="docker rm"
alias drmi="docker rmi"
alias dbu="docker build . -it"
alias dpa="docker ps -a"

#-------URL--------------------------
#if type wsl-open >/dev/null 2>&1; then
# Windows 
if [[ "$(uname -r)" == *microsoft* ]];  then 
    alias open="wsl-open"
    alias xdg-open="wsl-open"
    alias checkos="cat /etc/os-release"
fi
if type open >/dev/null 2>&1; then
    alias ggr="open http://google.com/"
    alias tube="open https://www.youtube.com"
    alias github="open https://www.github.com"
    alias twit="open https://www.twitter.com"
    alias insta="open https://www.instagram.com"
    alias qiita="open https://qiita.com"
fi

# Vim
alias vi="vim"
alias vr="vi ~/.vimrc"
alias svr="source ~/.vimrc"
# Neovim
if type nvim > /dev/null 2>&1; then 
    alias vi="nvim"   # Use neovim as vi
    alias vni="nvim ~/.config/nvim/init.lua"
    alias vnp="nvim ~/.config/nvim/lua/plugins.lua"
fi
# LunarVim https://github.com/LunarVim/LunarVim
[[ -a $HOME/.local/bin/lvim ]] && alias vi="lvim"; alias nv="nvim"

# tmux
#alias tma="tmux attach"
#alias tml="tmux list-window"

# zsh
alias va="vi $DOT_DIR/.zsh/defer/alias.zsh"
alias vz="vi $DOT_DIR/.zshrc"
alias vp="vi $DOT_DIR/.zprofile"
alias vl="vi $DOT_DIR/.zlogout"
alias sz="source $DOT_DIR/.zshrc"
alias sa="source $DOT_DIR/.zsh/defer/alias.zsh"
alias vd="vi ~/.dircolors-solarized/dircolors.ansi-dark_taka"

# python
alias py="python3"
alias ytconfig="vim ~/.config/yt-dlp/config"

# TeX
alias lmk="latexmk -pvc -output-directory=out"
alias lmkc="latexmk -c"
alias lmklua="latexmk -gg -pdflua -pvc -output-directory=out" 

# Clipboard
if [ -e /usr/bin/xsel ]; then
  alias pbcopy='xsel --clipboard --input'
  alias pbpaste='xsel --clipboard --output'
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
function pdfmin()
{
    local cnt=0
    for i in $@; do
        gs -sDEVICE=pdfwrite \
           -dCompatibilityLevel=1.4 \
           -dPDFSETTINGS=/ebook \
           -dNOPAUSE -dQUIET -dBATCH \
           -sOutputFile=${i%%.*}.min.pdf ${i} &
        (( (cnt += 1) % 4 == 0 )) && wait
    done
    wait && return 0
}

[[ $(type abbr) ]] && abbr import-aliases -S
