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
if type gls >/dev/null 2>&1; then
  # gls is contained in coreutils.
  alias ls="gls --color=auto"
else
  alias ls="ls -G"
fi
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
alias mkdir="mkdir -p"
alias ..="c ../"
alias back="pushd"
#alias diff="diff -U1"

# from fish
#------git----------->
alias gs="git status"
alias ga="git add"
alias gb="git branch"
alias gco="git checkout"
alias gcm="git commit -a -m"
alias gp="git push"
alias gpm="gp origin master"
#------git-----------<

alias gos="/usr/local/bin/gs"
#alias open="xdg-open"
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
alias sza="source ~/.zsh/alias.zsh"
alias vd="vi ~/.dircolors-solarized/dircolors.ansi-dark_taka"

# Vim
alias vr="vi ~/.vimrc"
alias vg="vi ~/.gvimrc"
alias svr="source ~/.vimrc"
alias vicolor="vi ~/develop/dotfiles/.vim/colors/ThemerVim.vim"
#alias tma="tmux attach"
#alias tml="tmux list-window"

# python
alias py="python3"
alias ytconfig="vim ~/.config/yt-dlp/config"

# Others
alias cddot="cd ~/develop/dotfiles"
alias nas="cd /Volumes/home"
alias kemonodl="bash $HOME/GIT/kemono-dl/DL.sh"

#-------------------------------
#	FUNCTION
#-------------------------------

function findf(){
  file=$1
  ls -ltr $(find -name $file)
}

function xtar (){
  opti=$1
  dirn=$2
  
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
  file=$1
  
  ffmpeg -i $file.ts -vcodec copy -acodec copy $file.mp4
} 
# PH DLer
function phdl (){
  phdl_path=$HOME/GIT/PornHub-downloader-python-master
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

function sshkey(){
    # When log in, Run ssh-agent.
    # psfile_=$HOME/.ssh/main
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







