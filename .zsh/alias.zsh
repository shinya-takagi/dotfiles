
# -----------------------------
# Alias
# -----------------------------
# Global Alias (can set alias of pipeline)
alias -g L='| less'
alias -g H='| head'
alias -g G='| grep'
alias -g gr='| grep --color'
alias -g GI='| grep -ri'

# local Alias
alias ls='ls --color=auto'
alias lst='ls -ltr --color=auto'
alias la='ls -la --color=auto'
alias ll='ls -l --color=auto'
alias ltr='ll -rt'

alias du="du -h"
alias df="df -h"
alias su="su -l"
alias so='source'
alias vi='vim'
alias vz='vim ~/.zshrc'
alias c='cd'
alias cp='cp -i'
alias rm='rm -i'
alias mkdir='mkdir -p'
alias ..='c ../'
alias back='pushd'
alias diff='diff -U1'

# from fish
#------git------------
alias gs="git status"
alias ga="git add"
alias open="xdg-open"
alias vvmrc="vi ~/.vimrc"
alias svmrc="source ~/.vimrc"
alias et="exit"
alias rl="readlink -f"
alias dc="cd"
alias sl="ls"
alias cdrive="cd /mnt/c/Users/shiny"
#-------URL--------------------------
alias ggr='open http://google.com/'
alias tube='open https://www.youtube.com'
alias github='open https://www.github.com'
alias twit='open https://www.twitter.com'
alias insta='open https://www.instagram.com'
alias qiita='open https://qiita.com'

# zsh
alias va='vi ~/.zsh/alias.zsh'
alias vz='vi ~/.zshrc'
alias sz='source ~/.zshrc'

#
#alias tma='tmux attach'
#alias tml='tmux list-window'

#-------------------------------
#	FUNCTION
#-------------------------------

findf(){
  file=$1
  ls -ltr $(find -name $file)
}

xtar (){
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
        echo " Format -> gtar option 'DIRECTORY'"
esac
}

testfunc (){
  case $SHELL in
    "/usr/bin/zsh") ls ;;
    * ) ls -l
  esac
}









