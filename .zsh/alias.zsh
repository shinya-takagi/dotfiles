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

if [ -e "$HOME/pass.sh" ]; then
  alias sshp="sshpass -p $(sh ~/pass.sh) ssh"
fi

# from fish
#------Git------------
alias gs="git status"
alias ga="git add"
alias gb="git branch"
alias gco="git checkout"
alias gcm="git commit -a -m"
alias gp="git push"
alias gpm="gp origin master"
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

alias et="exit"
alias rl="readlink -f"
alias dc="cd"
alias sl="ls"

#-------URL--------------------------
#if type xdg-open >/dev/null 2>&1; then
#  alias open="xdg-open"
#fi
#if type wsl-open >/dev/null 2>&1; then
if [[ "$(uname -r)" == *microsoft* ]];  then 
   alias open="wsl-open"
   alias xdg-open="wsl-open"
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
alias vz="vim ~/.zshrc"
alias va="vi ~/.zsh/alias.zsh"
alias vz="vi ~/.zshrc"
alias vp="vi ~/.zprofile"
alias vl="vi ~/.zlogout"
alias sz="source ~/.zshrc"
alias sa="source ~/.zsh/alias.zsh"
alias vd="vi ~/.dircolors-solarized/dircolors.ansi-dark_taka"

# python
alias py="python3"
alias ytconfig="vim ~/.config/yt-dlp/config"

# TeX
alias lmk="latexmk -pvc -output-directory=out"
alias lmkc="latexmk -c"
alias lmklua="latexmk -gg -pdflua -pvc -output-directory=out" 

# Windows 
alias user="cd /mnt/c/Users/shiny"
#alias cdrive="cd /mnt/c/Users/shiny"
alias checkos="cat /etc/os-release"
alias gefwin="cd /mnt/c/Users/shiny/mydata/miscellinous/GEF-2016-V1-2_edited"

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

function nasmnt(){
  local opt=$1
  local DECRYPT_FILE DOTFILE_PATH
  DOTFILE_PATH="$HOME/.dotfiles"
  # PASSWORD=$(bash $DOTFILE_PATH/tips/nas_dec.sh)
  PASSWORD=$2
  case "$opt" in
    "-m" ) sudo mount -t cifs -o username=shinya,password=$PASSWORD,uid=1000,gid=985,iocharset=utf8 //192.168.3.8/home /mnt/nas ;;
    "-u" ) sudo umount /mnt/nas ;;
    *    ) echo " USAGE : $0 [OPTION]"
           echo "OPTION : -m  ->  mount your nas"
           echo "         -u  ->  unmount your nas"
   esac
}

function nasmnt_lab(){
  local IPADDRESS=192.168.1.90
  local opt=$1
  #sudo mount -t cifs -o //$IPADDRESS/b4 /mnt/b4
  #sudo mount //$IPADDRESS/b4 /mnt/b4 -o uid=1000,gid=998,vers=1.0,iocharset=utf8
  #-o username=admin,password=reaction1,uid="$UID",gid="$GID",vers=2.0 
  case "$opt" in
    "-m" ) sudo mount //$IPADDRESS/b4 /mnt/b4 -o uid=1000,gid=985,vers=1.0,iocharset=utf8;;
    "-u" ) sudo umount /mnt/b4 ;;
    *    ) echo " USAGE : $0 [OPTION]"
           echo "OPTION : -m  ->  mount your nas"
           echo "         -u  ->  unmount your nas"
   esac
}

function usbmnt(){
  local opt=$1
  local usb="$2":
  case "$opt" in
    "-m" ) sudo mount -t drvfs $usb /mnt/usb ;;
    "-u" ) sudo umount /mnt/usb ;;
    *    ) echo "  
            USAGE : $0 [OPTION]
           OPTION : -m  ->  mount your usb
                    -u  ->  unmount your usb
          "
   esac
}

function findf(){
  local file=$1
  ls -ltr $(find -name $file)
}

function xtar (){
  local opti=$1
  local dirn=$2

  case "$opti" in
   "a" )  tar cvf  $dirn.tar $dirn ;;     #normal tar
   "g" )  tar cvzf $dirn.tar.gz $dirn ;;  #tar plus zip
   "b" )  tar cvjf $dirn.tar.bz2 $dirn ;; #tar plus bz2
   "x" )  tar cvJf $dirn.tar.xz $dirn ;;  #tar plus xz(slow process, highly compress rate)
   "e" )  tar xvf $dirn ;; #Extraction
    *  )  echo " =======ERROR!! CANNOT COMPRESS DIRECTORY!!======="
          echo " =                                               ="
          echo " =  CHECK DIRECTORY NAME, OPTION, AND FORMAT!!!  ="
          echo " =                                               ="
          echo " ================================================="
          echo " option : a -> tar , g -> gz , b -> bz2 , x -> xz" 
          echo "          e -> Extract archive."
          echo " Format -> gtar option "DIRECTORY""
  esac
}

function testfunc (){
  case $SHELL in
    "/usr/bin/zsh") ls ;;
    * ) ls -l
  esac
}
# convert a ts-file to mp4-file.
function tstomp4 (){
  local file=$1

  ffmpeg -i $file.ts -vcodec copy -acodec copy $file.mp4
} 
# PH DLer
function phdl (){
  phdl_path=$HOME/get/PornHub-downloader-python-master
  cd $phdl_path
  option=$1
  cmd=$2
  case $option in
    "s" ) python3 $phdl_path/phdler.py start ;;
    "a" ) python3 $phdl_path/phdler.py add $cmd ;; 
    "d" ) python3 $phdl_path/phdler.py delete $cmd ;;
    "l" ) python3 $phdl_path/phdler.py list $cmd ;;
    *) echo "Bad option or URL. Check your option and URL."
  esac
}

# MCF code
function mcf(){
  local PYTHON_PATH="$HOME"/python
  local MCF_DIR="$PYTHON_PATH"/mcf
  local MCF_alev="$MCF_DIR"/mcf_alev.py
  local MCF_bx="$MCF_DIR"/mcf_bx.py
  local MCF_bxa="$MCF_DIR"/mcf_bx_add.py
  local MCF_bxtm="$MCF_DIR"/mcf_bx_times.py
  local MCF_bxsolo="$MCF_DIR"/mcf_bx_times_solo.py
  local MCF_bxt="$MCF_DIR"/mcf_table.py
  local MCF_DATA=/mnt/c/Users/shiny/mydata/Origin/MCF
  local opt1="$1"
  case "$opt1" in
    "data" ) cd "$MCF_DATA" ;; 
    "alev"  ) python3 "$MCF_alev" ;;
    "bx"  ) python3 "$MCF_bx" ;;
    "bxa"  ) python3 "$MCF_bxa" ;;
    "bxav"  ) vi "$MCF_bxa" ;;
    "bxtm"  ) python3 "$MCF_bxtm" ;;
    "bxsolo"  ) python3 "$MCF_bxsolo" ;;
    "bxt"  ) python3 "$MCF_bxt" ;;
    "mv095" ) bash "$MCF_DIR"/mcf_move.sh ;; 
#   "move" ) sh "$MCF_DIR"/move ;;
#   "movev" ) vi "$MCF_DIR"/move ;;
    "copy" ) cp "$MCF_CODE" . ;;  
      *    ) cd "$MCF_DIR"
  esac
}

function sshkey(){
  # When log in, Run ssh-agent.
  psfile_=$HOME/.ssh/main
  psnum=$(ps ax | grep ssh-agent | grep -v grep | wc -l)
  #if [ $psnum -le 1 ]; then
  #if [ $psnum -ne 0 ]; then
  if [ -z $SSH_AGENT_PID ]; then 
  #   echo "no sshagent"
      eval `ssh-agent` > /dev/null 2>&1
  #if [ -e $psfile_ ]; then 
     if [ -e "$HOME/.ssh/id_rsa_vostok2" ]; then
       keys=id_rsa_vostok2
     elif [ -e "$HOME/.ssh/id_rsa_github" ]; then
       keys=id_rsa_github
     elif [ -e "$HOME/.ssh/id_rsa_vostok2" ] && [ -e "$HOME/.ssh/id_rsa_github" ]; then
       keys=id_rsa_vostok2
     fi
  #    agentunlock_=$(openssl rsautl -decrypt -inkey $psfile_.key -in $psfile_)
  #    echo  "$agentunlock_"\n | eval `ssh-add $HOME/.ssh/"$keys" > /dev/null 2>&1`
  #    unset psfile_ agentunlock_
      eval `ssh-add $HOME/.ssh/"$keys"> /dev/null 2>&1`
   else
  #  echo "PASSWORD?"
  #else
     echo "ssh-agent exist. Processes:"$psnum", PID:$SSH_AGENT_PID"
   fi
}

