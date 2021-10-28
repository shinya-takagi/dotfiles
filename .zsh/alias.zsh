
# -----------------------------
# Alias
# -----------------------------
# Global Alias (can set alias of pipeline)
alias -g L="| less"
alias -g H="| head"
alias -g G="| grep"
alias -g gr="| grep --color"
alias -g GI="| grep -ri"

# local Alias
alias ls="ls --color=auto"
alias lst="ls -ltr"
alias la="ls -la"
alias ll="ls -l"
alias ltr="ll -rt"
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
alias sshp="sshpass -p $(sh ~/pass.sh) ssh"

# from fish
#------git------------
alias gs="git status"
alias ga="git add"
alias gb="git branch"
alias gco="git checkout"
alias gcm="git commit -a -m"
alias gp="git push"
alias gpm="gp origin master"

alias open="xdg-open"
alias et="exit"
alias rl="readlink -f"
alias dc="cd"
alias sl="ls"

#-------URL--------------------------
alias ggr="open http://google.com/"
alias tube="open https://www.youtube.com"
alias github="open https://www.github.com"
alias twit="open https://www.twitter.com"
alias insta="open https://www.instagram.com"
alias qiita="open https://qiita.com"

# zsh
alias vi="vim"
alias vz="vim ~/.zshrc"
alias va="vi ~/.zsh/alias.zsh"
alias vz="vi ~/.zshrc"
alias sz="source ~/.zshrc"
alias vd="vi ~/.dircolors-solarized/dircolors.ansi-dark_taka"

# Vim
alias vr="vi ~/.vimrc"
alias svr="source ~/.vimrc"
#alias tma="tmux attach"
#alias tml="tmux list-window"

# python
alias py="python3"

# Windows 
alias user="cd /mnt/c/Users/shiny"
#alias originlab="cd /mnt/c/Users/shiny/OneDrive/ドキュメント/OriginLab/"
#alias cdrive="cd /mnt/c/Users/shiny"


#-------------------------------
#	FUNCTION
#-------------------------------

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







