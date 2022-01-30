 
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

if [ -e "$HOME/pass.sh" ]; then
  alias sshp="sshpass -p $(sh ~/pass.sh) ssh"
fi

# from fish
#------git------------
alias gs="git status"
alias ga="git add"
alias gb="git branch"
alias gco="git checkout"
alias gcm="git commit -a -m"
alias gp="git push"
alias gpm="gp origin master"

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
#alias tma="tmux attach"
#alias tml="tmux list-window"
#
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

# Windows 
alias user="cd /mnt/c/Users/shiny"
#alias originlab="cd /mnt/c/Users/shiny/OneDrive/ドキュメント/OriginLab/"
#alias cdrive="cd /mnt/c/Users/shiny"
alias checkos="cat /etc/os-release"
alias gefwin="cd /mnt/c/Users/shiny/mydata/miscellinous/GEF-2016-V1-2_edited"

#----- OS Distrbution condition ---------------------->
TMPOS=$(cat /etc/os-release | head -2 | tail -1)
PRETTY_NAME=${TMPOS:13}
#---------For Arch Linux---------------->
if [ $PRETTY_NAME = "Arch Linux\"" ]; then
    alias al="echo Arch Linux"
    alias pacman="sudo pacman"
    alias pacmanupdate="sudo pacman -Sy"
    alias vmemo="vim $HOME/dotfiles/tips/memo"
    alias cmemo="cat $HOME/dotfiles/tips/memo"
    alias nas="cd /mnt/nas"
#---------Arch Linux--------<
#---------For Ubuntu-------------------->
elif [ $PRETTY_NAME = "Ubuntu\"" ]; then
    alias al="echo Ubuntu"
fi
#---------Ubuntu--------<
unset TMPOS PRETTY_NAME
#---- Condition -------------<

#-------------------------------
#	FUNCTION
#-------------------------------

function nasmnt(){
  local opt=$1
  local DECRYPT_FILE DOTFILE_PATH
  DOTFILE_PATH="$HOME/dotfiles"
  PASSWORD=$(bash $DOTFILE_PATH/tips/nas_dec.sh)
  case "$opt" in
    "-m" ) sudo mount -o username=shinya,password=$PASSWORD,uid=1000,gid=998 //192.168.3.8/home /mnt/nas ;;
    "-u" ) sudo umount /mnt/nas ;;
    *    ) echo " USAGE : $0 [OPTION]"
           echo "OPTION : -m  ->  mount your nas"
           echo "         -u  ->  unmount your nas"
   esac
}

function nasmnt_lab(){
  local IPADDRESS=192.168.1.254
  local opt=$1
  #sudo mount -t cifs -o //$IPADDRESS/b4 /mnt/b4
  #sudo mount //$IPADDRESS/b4 /mnt/b4 -o uid=1000,gid=998,vers=1.0,iocharset=utf8
  #-o username=admin,password=reaction1,uid="$UID",gid="$GID",vers=2.0 
  case "$opt" in
    "-m" ) sudo mount //$IPADDRESS/b4 /mnt/b4 -o uid=1000,gid=998,vers=1.0,iocharset=utf8;;
    "-u" ) sudo umount /mnt/b4 ;;
    *    ) echo " USAGE : $0 [OPTION]"
           echo "OPTION : -m  ->  mount your nas"
           echo "         -u  ->  unmount your nas"
   esac
}

function usbmnt(){
  local opt=$1
  case "$opt" in
    "-m" ) sudo mount -t drvfs D: /mnt/usb ;;
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

#-------Alias From zshrc------------------------->
# -----------------------------
# Alias
# -----------------------------
# グローバルエイリアス
#alias -g L='| less'
#alias -g H='| head'
#alias -g G='| grep'
#alias -g GI='| grep -ri'
#
## Alias
#alias ls='ls --color=auto'
#alias lst='ls -ltr --color=auto'
#alias la='ls -la --color=auto'
#alias ll='ls -l --color=auto'
#
#alias du="du -Th"
#alias df="df -Th"
#alias su="su -l"
#alias so='source'
#alias vi='vim'
#alias vz='vim ~/.zshrc'
#alias c='cd'
#alias cp='cp -i'
#alias rm='rm -i'
#alias mkdir='mkdir -p'
#alias ..='c ../'
#alias back='pushd'
#alias diff='diff -U1'
#
#alias tma='tmux attach'
#alias tml='tmux list-window'

#alias dki="docker run -i -t -P"
#alias dex="docker exec -i -t"
#alias drmf='docker stop $(docker ps -a -q) && docker rm $(docker ps -a -q)'

# -----------------------------
# Plugin
# -----------------------------
# root のコマンドはヒストリに追加しない
#if [ $UID = 0 ]; then
#  unset HISTFILE
#  SAVEHIST=0
#fi

#function h {
#  history
#}

#function g() {
#  egrep -r "$1" .
#}

#function t()
#{
#  tmux new-session -s $(pwd |sed -E 's!^.+/([^/]+/[^/]+)$!\1!g' | sed -e 's/\./-/g')
#}
#
#function psgrep() {
#  ps aux | grep -v grep | grep "USER.*COMMAND"
#  ps aux | grep -v grep | grep $1
#}
#
#function dstop()
#{
#  docker stop $(docker ps -a -q);
#}
#
#function drm()
#{
#  docker rm $(docker ps -a -q);
#}

#PLUGIN SETUP
# -----------------------------
# Plugin
# -----------------------------
# zplugが無ければインストール
# if [[ ! -d ~/.zplug ]];then
#   git clone https://github.com/zplug/zplug ~/.zplug
# fi
#
## zplugを有効化する
#source ~/.zplug/init.zsh
#
## プラグインList
## zplug "ユーザー名/リポジトリ名", タグ
# zplug "zsh-users/zsh-completions"
# zplug "zsh-users/zsh-autosuggestions"
# zplug "zsh-users/zsh-syntax-highlighting", defer:2
# zplug "b4b4r07/enhancd", use:init.sh
##zplug "junegunn/fzf-bin", as:command, from:gh-r, file:fzf
#
## インストールしていないプラグインをインストール
# if ! zplug check --verbose; then
#   printf "Install? [y/N]: "
#   if read -q; then
#       echo; zplug install
#   fi
# fi
#
## コマンドをリンクして、PATH に追加し、プラグインは読み込む
#zplug load --verbose
#
# -----------------------------
# PATH
# -----------------------------
#case "${OSTYPE}" in
#  darwin*)
#    export PATH=/opt/local/bin:/opt/local/sbin:$PATH
#    export MANPATH=/opt/local/share/man:/opt/local/man:$MANPATH
#  ;;
#esac

# -----------------------------
# Python
# -----------------------------
#export PYENV_ROOT="$HOME/.pyenv"
#export PATH="$PYENV_ROOT/bin:$PATH"
##eval "$(pyenv init -)"
#alias pipallupgrade="pip freeze --local | grep -v '^\-e' | cut -d = -f 1  | xargs pip install -U"

# -----------------------------
# Golang
# -----------------------------
#if which go > /dev/null 2>&1  ; then
#  export CGO_ENABLED=1
#  export GOPATH=$HOME/dev/go
#  export PATH=$PATH:$(go env GOROOT)/bin:$GOPATH/bin
#fi
 
# -----------------------------
# Git
# -----------------------------
#function gt() {
#  is_in_git_repo || return
#  git tag --sort -version:refname |
#  fzf-down --multi --preview-window right:70% \
#    --preview 'git show --color=always {} | head -200'
#}
#
#function gr() {
#  is_in_git_repo || return
#  git remote -v | awk '{print $1 "\t" $2}' | uniq |
#  fzf-down --tac \
#    --preview 'git log --oneline --graph --date=short --pretty="format:%C(auto)%cd %h%d %s" {1} | head -200' |
#  cut -d$'\t' -f1
#}
#
#function gs() {
#  is_in_git_repo || return
#  git stash list | fzf-down --reverse -d: --preview 'git show --color=always {1}' |
#  cut -d: -f1
#}#
#








