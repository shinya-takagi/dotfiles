# .bashrc

# Source global definitions
#if [ -f /etc/bashrc ]; then
#    . /etc/bashrc
#fi

#----S.Takagi 2021.11.07. ----Show Git Prompt-----> 
export PROMPT_COMMAND="source $HOME/.bashrc"
if [ -f $HOME/.git-completion.bash ]; then
    source $HOME/.git-completion.bash
fi
if [ -f $HOME/.git-prompt.sh ]; then
    source ~/.git-prompt.sh
#   export GIT_STATUS=$(__git_ps1)
fi
export GIT_STATUS="$(__git_ps1 "(%s)") "
GIT_PS1_SHOWDIRTYSTATE=true
GIT_PS1_SHOWUNTRACKEDFILES=true
GIT_PS1_SHOWSTASHSTATE=true
GIT_PS1_SHOWUPSTREAM=auto
#----Git------------<  
P_RED="\[\033[01;31m\]"
P_GREEN="\[\033[01;32m\]"
P_YELLOW="\[\033[01;33m\]"
P_BLUE="\[\033[01;34m\]"
P_MAGENTA="\[\033[01;35m\]"
P_CYAN="\[\033[01;36m\]"
P_WHITE="\[\033[00m\]"
NOW_TIME="<$(date +"%Y/%m/%d %p %I:%M:%S")>"
if [ "$(echo $GIT_STATUS | grep "+")" ]; then 
    export PS1="$P_BLUE \w "$P_RED"$GIT_STATUS"$P_WHITE""$NOW_TIME"\n"$P_WHITE" $ "
elif [ "$(echo $GIT_STATUS | grep "%")" ]; then 
    export PS1="$P_BLUE \w "$P_YELLOW"$GIT_STATUS"$P_WHITE""$NOW_TIME"\n"$P_WHITE" $ "
elif [ "$(echo $GIT_STATUS | grep "*")" ]; then 
    export PS1="$P_BLUE \w "$P_YELLOW"$GIT_STATUS"$P_WHITE""$NOW_TIME"\n"$P_WHITE" $ "
else
    GIT_STATUS=""
    export PS1="$P_BLUE \w "$P_GREEN"$GIT_STATUS"$P_WHITE""$NOW_TIME"\n"$P_WHITE" $ "
fi

# ---PROMPT------------<

export EDITOR=vim
set -o vi
bind 'set show-mode-in-prompt on'
#eval `dircolors $HOME/.dircolors-solarized/dircolors.ansi-dark_taka`

# alias list
# basic command
alias ls="ls --color"
alias cp="cp -b -i"
alias dcp="cp -rbi"
#alias drm="rm -rv"
alias remove="rm -rv"
alias bh="bhosts"
alias bhop='bhosts | grep -v clo | grep -v una'
alias bj="bjobs"
alias bjall="bjobs -u all"
alias et="exit"
alias rl="readlink -f"
alias dc="cd"
alias sl="ls"
alias ci="vi" 
alias dd=:
alias showuser="ps ax | grep sshd"
# ls
alias ll="ls -l"
alias llh="ls -lh"
alias la="ls -a" 
alias lt="llh -t"
alias ltr="llh -rt"
alias lls="llh -S"
alias llsr="llh -Sr"

# Vim
alias vi="vim"
alias vbp="vim ~/.bash_profile"
alias sbp="source ~/.bash_profile"
alias vb="vim ~/.bashrc"
alias sb="source ~/.bashrc"
alias vr="vi ~/.vimrc"
alias sr="source ~/.vimrc"
alias ftvim="vi ~/.vim/ftplugin/fortran.vim"
alias vimmk="vi -O ~/.Makefile_tmp Makefile"


# Others
alias memo="vi ~/own/dev/memo.c"
alias share="cd ~/cloud/share"
alias cmd="cp ~/own/dev/cmd . ; mv cmd $1"  #option is a file name.
alias testecho="echo $1"
alias allcp="cp * ~/own/cmd"
alias calcune="cd ~/calcu/langne"
alias epsilon="cat ~/lang2018/pot2017/ldmc4a2017b/epsilon_t"
alias amano="cd $HOME/lang2021/amano2021/"
alias zda="vi ~/own/dev/ZDA.dat"
alias dvi="vi -d"
alias cemacs="emacs -nw"

alias 4dim="cd /home/takagi/lang2021/4dim/4dt/lang25_26"
alias ama="cd $HOME/lang2021/amano2021/langtrant"
alias aman="cd $HOME/lang2021/amano2021/langtranN"
alias fus="cd $HOME/lang2021/Fusion_EVP"
alias code="cd $HOME/own/code"
alias py="python"

alias term="gnome-terminal &"

# Rotation directory
ROTUT=~/lang2020/langfi/rot
alias rotu="cd $ROTUT"
alias rotp="cd $ROTUT/paper"

# Multi-chance fission
alias vistmass="vi langST1_14_ty1Mass.f"

# change directory to dot
alias ..="cd .."
alias ..2="cd ../.."
alias ..3="cd ../../.."

# Git command
alias ga="git add"
alias gs="git status"

#Original Scripts
#alias CPUcal="sh ~/own/code/CPUtime"

#function 
function hoge() {
    echo "This is function hoge"
}
function tt () {
    local nowd=$PWD
    cd ~/own/dev
    ./timetable.sh
    cd $nowd
}
function sortsamx () {
    local codepath=$HOME/own/code
    local sortfile=sortsam
    local samnum=`seq 1 8`
    
    cp $codepath/$sortfile .
    ./$sortfile
    
    for num in $samnum;do
        mv aasam$num aasam"$num"_bef
        mv aasam"$num"_sort aasam$num
    done
    
    rm $sortfile
}
function nis(){
    case "$1" in
     "rl"    ) cd ~/proj/nishi/run_test/res/ ; rl seed.out ; rl fabund_a.dat ;;
     "ll"    ) cd ~/proj/nishi/run_test/in ; ll ;;
     "run"   ) cd ~/proj/nishi/run_test ; NHP ;;
     "viexe" ) vi ~/proj/nishi/run_test/exec_all.sh ;;
     *       ) cd /home/takagi/proj/nishi/run_test
    esac
}
function langfi(){
    case "$1" in
     "auto" ) cd ~/lang2020/langfi/langfiss ;;
     "m" ) cd ~/lang2020/langfi/langfm3a ;;
     "m92" ) vi ~/lang2020/langfi/langfm3a/ate92tmd4 ;;
     "m10" ) vi ~/lang2020/langfi/langfm3a/ate100tmd4 ;;
     "u" ) cd ~/lang2020/langfi/langfm3aura ;;
     "u92" ) vi ~/lang2020/langfi/langfm3aura/ate92tmd4 ;;
     "u10" ) vi ~/lang2020/langfi/langfm3aura/ate100tmd4 ;;
     "s" ) cd ~/lang2020/langfi/langfm3asub ;;
     "s92" ) vi ~/lang2020/langfi/langfm3asub/ate92tmd4 ;;
     "s10" ) vi ~/lang2020/langfi/langfm3asub/ate100tmd4 ;;
     *   ) { echo "fi - fission , h -heavy(fusion) , e - input_exe , 92 - < Z=100 , 10 - > Z=100 "
             echo "auto - lang2020/langfiss"
    }
    esac
}
function langfu(){
    case "$1" in
     "t" ) cd ~/lang2020/langfu/test276 ;;
     "ti" ) vi ~/lang2020/langfu/test276/atet6m ;;
     "auto"  ) cd ~/lang2020/langfu/lang276/ ;;
     *   ) echo "t - Dir:test276, i - input_exe, auto - Dir:lang276(auto calculation)"
    esac
}
# Multi chance fission directory
function mcf() {
    local MCF=$HOME/lang2021/MCF
    local DATA=collection
    local MULTI=Multi
    case "$1" in
        "d" ) cd $MCF/$DATA ;;
        "m" ) cd $MCF/$MULTI ;;
       "h*" ) { echo "USAGE: mcf [OPTION]"; echo""
                echo "        : m  -> move to Calculation dir" 
                echo "        : h  -> show command list." 
                echo ""
                echo "        : *  -> move to MCF dir." 
       };;
        *   ) cd $MCF
    esac
}
function pot(){
    local pot_path=lang2018/pot2017
    local poty_path=lang2018/pot2021ya
    case "$1" in
     "l"  ) cd ~/$pot_path/ldmc4a2017b ;;
     "s"  ) cd ~/$pot_path/twoc3 ;;
     "s4" ) cd ~/$pot_path/twoc3_4 ;;
     "d"  ) cd ~/$pot_path/data5f ;;
    "dd"  ) cd ~/$pot_path/data5f/Diabatic ;;
    # ----add_potential_for_yamasaki-------------
     "ly" ) cd ~/$poty_path/ldmc5next ;;
     "sy" ) cd ~/$poty_path/twoc5 ;;
     "dy" ) cd ~/$poty_path/data5f ;;
    # --------------------------------------------
     *    ) echo "USAGE: pot [OPTION]" 
            echo "[OPTION]  l - liquid, s -shell, d - data, dd - Diabatic"
            echo "[OPTION]  ly - liquid for Y's Potential, sy - shell for Same Potential"
    esac
}
function surv(){
    case "$1" in
     ""  ) cd ~/code/survive ;;
     "k" ) cd ~/code/survive/minato8k ;;
     "t" ) cd ~/code/survive/minato8t ;;
      *  ) { echo "option list"
            echo "none - Dir:survive , k - Dir:minato8k , t - Dir:minato8t"
    }
    esac
}

function xtar (){
    local opti=$1
    local dirn=$2
    
    case "$opti" in
     "a" )  tar -cvf  $dirn.tar $dirn ;;     #normal tar
     "g" )  tar -cvzf $dirn.tar.gz $dirn ;;  #tar plus zip
     "b" )  tar -cvjf $dirn.tar.bz2 $dirn ;; #tar plus bz2
     "x" )  tar -cvJf $dirn.tar.xz $dirn ;;  #tar plus xz(slow process, highly compress rate)
     "e" )  tar -xvf $dirn ;; #Extraction
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

function bkillloop () {
    local first=$1
    local   end=$2
    if [ $first -gt $end ]; then
        local tmpvalue
        tmpvalue=$first
           first=$end
             end=$tmpvalue
        unset tmpvalue
    fi
    for num in $(seq $first $end)
    do
        bkill $num
    done
}
function bashtemp (){
    local name=$1
    local basef=$HOME/own/code/bashtemplate.sh
    
    if [ -z "$name" ]; then
        echo "No argument"
    elif [ -e $name ]; then
        echo ""$name" already exists."
    else
        cp $basef $name
        vi $name
    fi
}

function findf () {
    local file=$1
    ls -lrt $(find -name $file)
}
function findg () {
    local file=getloopnum
    ls -lrt $(find -name $file)
}

function form (){
    local form_dir=$HOME/code/form/conf
    local num=$1
    case "$num" in
        "1" ) cd "$form_dir"1 ;;
        "2" ) cd "$form_dir"2 ;;
        "3" ) cd "$form_dir"3 ;;
        *   ) echo "Error! $num is undefined. you can use the numbers from 1 to 3."
    esac
}

function subjob1(){
    local EXECUTABLE=$1
    bsubomp -m vostok1 -n 1 -o wo ./$EXECUTABLE
}
#function drm(){
#    local arg_num=$#
#    local move_things=$1
#    local trash_path=$HOME/.trashbox
#    if [ $arg_num -eq 1 ]; then
#        mv "$move_things" $trash_path/"$move_things"_trash || stop 
#        echo $(date +'%Y/%m/%d %H:%M:%S') >> $trash_path/trash_list 
#        echo "$move_things is from "$PWD"." >> $trash_path/trash_list
#        echo ""$move_things" is moved in "$HOME/.trashbox.""
#    elif [ $arg_num -eq 0 ]; then
#        echo "argment "aru_num" is $arg_num."
#    else
#        echo "argment "aru_num" is too many("$arg_num", only 1)."
#    fi
#}

