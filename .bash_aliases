#!/usr/bin/env bash

shopt -s expand_aliases

# alias list
# basic command
alias ls="ls --color"
alias cp="cp -b -i"
alias dcp="cp -rbi"
#alias drm="rm -rv"
alias remove="rm -rv"
alias rm="trash.sh"
# alias bh="bhosts"
# alias bhop='bhosts | grep -v clo | grep -v una'
# alias bj="bjobs"
# alias bjall="bjobs -u all"
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
# alias vi="vim"
alias vbp="vim ~/.bash_profile"
alias sbp="source ~/.bash_profile"
alias vb="vim ~/.bashrc"
alias sb="source ~/.bashrc"
alias vr="vi ~/.vimrc"
alias sr="source ~/.vimrc"
alias vba="vim ~/.bash_aliases"
alias sba="source ~/.bash_aliases"
# alias ftvim="vi ~/.vim/ftplugin/fortran.vim"
# alias vimmk="vi -O ~/.Makefile_tmp Makefile"
# alias nv="nvim"
alias vi="nvim"

# Others
# alias memo="vi ~/own/dev/memo.c"
# alias share="cd ~/cloud/share"
# alias cmd="cp ~/own/dev/cmd . ; mv cmd $1" #option is a file name.
# alias testecho="echo $1"
# alias allcp="cp * ~/own/cmd"
# alias calcune="cd ~/calcu/langne"
alias epsilon="cat ~/lang2018/pot2017/ldmc4a2017b/epsilon_t"
# alias amano="cd $HOME/lang2021/amano2021/"
alias zda="cat ~/own/dev/ZDA.dat"
alias dvi="vi -d"
# alias cemacs="emacs -nw"

# process
alias psme="ps ax | grep $(whoami)"

# alias 4dim="cd /home/takagi/lang2021/4dim/4dt/lang25_26"
# alias ama="cd $HOME/lang2021/amano2021/langtrant"
# alias aman="cd $HOME/lang2021/amano2021/langtranN"
# alias fus="cd $HOME/lang2021/Fusion_EVP"
# alias code="cd $HOME/own/code"
alias py="python3"
alias ifortdebug="ifort  -mkl -check all -warn all -gen_interfaces -fpe0 -ftrapuv -traceback -g $1"

# Gnome commnands
# alias term="gnome-terminal &"

# porg package manager
# alias porg="porg --logdir=$HOME/local/root/var/log/porg"

# Rotation directory
# ROTUT=~/lang2020/langfi/rot
# alias rotu="cd $ROTUT"
# alias rotp="cd $ROTUT/paper"
# alias fiss="cd $HOME/lang2020/langfi/rot/paper/fission"
# alias jaea="cd $HOME/lang2023/JAEA"
# alias dev="cd $HOME/lang2020/langfi/rot/paper/dev"

# Change directory to RISP(Korea Group)
# alias risp="cd $HOME/lang2021/risp"

# Multi-chance fission
# alias vistmass="vi langST1_14_ty1Mass.f"

# change directory to dot
alias ..="cd .."
alias ..2="cd ../.."
alias ..3="cd ../../.."

# Slurm
alias sq="squeue -o %.8i%.14u%.12T%.7C%.12n%.15j%.10M%.11r"
alias si="sinfo -N -o %.12N%.15C%.8t"

# if type tmux 2>&1; then
# alias tmux="LD_LIBRARY_PATH=$HOME/local/lib $HOME/local/bin/tmux"
# fi

#function
# function tt() {
#   local nowd=$PWD
#   cd ~/own/dev
#   ./timetable.sh
#   cd $nowd
# }
# function sortsamx() {
#   local codepath=$HOME/own/code
#   local sortfile=sortsam
#   local samnum=$(seq 1 8)
# 
#   cp $codepath/$sortfile .
#   ./$sortfile
# 
#   for num in $samnum; do
#     mv aasam$num aasam"$num"_bef
#     mv aasam"$num"_sort aasam$num
#   done
# 
#   rm $sortfile
# }
# function nis() {
#   case "$1" in
#   "rl")
#     cd ~/proj/nishi/run_test/res/
#     rl seed.out
#     rl fabund_a.dat
#     ;;
#   "ll")
#     cd ~/proj/nishi/run_test/in
#     ll
#     ;;
#   "run")
#     cd ~/proj/nishi/run_test
#     NHP
#     ;;
#   "viexe") vi ~/proj/nishi/run_test/exec_all.sh ;;
#   *) cd /home/takagi/proj/nishi/run_test ;;
#   esac
# }
# function langfi() {
#   case "$1" in
#   "auto") cd ~/lang2020/langfi/langfiss ;;
#   "m") cd ~/lang2020/langfi/langfm3a ;;
#   "m92") vi ~/lang2020/langfi/langfm3a/ate92tmd4 ;;
#   "m10") vi ~/lang2020/langfi/langfm3a/ate100tmd4 ;;
#   "u") cd ~/lang2020/langfi/langfm3aura ;;
#   "u92") vi ~/lang2020/langfi/langfm3aura/ate92tmd4 ;;
#   "u10") vi ~/lang2020/langfi/langfm3aura/ate100tmd4 ;;
#   "s") cd ~/lang2020/langfi/langfm3asub ;;
#   "s92") vi ~/lang2020/langfi/langfm3asub/ate92tmd4 ;;
#   "s10") vi ~/lang2020/langfi/langfm3asub/ate100tmd4 ;;
#   *) {
#     echo "fi - fission , h -heavy(fusion) , e - input_exe , 92 - < Z=100 , 10 - > Z=100 "
#     echo "auto - lang2020/langfiss"
#   } ;;
#   esac
# }
# function langfu() {
#   case "$1" in
#   "t") cd ~/lang2020/langfu/test276 ;;
#   "ti") vi ~/lang2020/langfu/test276/atet6m ;;
#   "auto") cd ~/lang2020/langfu/lang276/ ;;
#   *) echo "t - Dir:test276, i - input_exe, auto - Dir:lang276(auto calculation)" ;;
#   esac
# }
# # Multi chance fission directory
# function mcf() {
#   local MCF=$HOME/lang2021/MCF
#   local DATA=collection
#   local MULTI=Multi
#   case "$1" in
#   "d") cd $MCF/$DATA ;;
#   "m") cd $MCF/$MULTI ;;
#   "h*") {
#     echo "USAGE: mcf [OPTION]"
#     echo""
#     echo "        : m  -> move to Calculation dir"
#     echo "        : h  -> show command list."
#     echo ""
#     echo "        : *  -> move to MCF dir."
#   } ;;
#   *) cd $MCF ;;
#   esac
# }
function pot() {
  local pot_path=lang2018/pot2017
  local poty_path=lang2018/pot2021ya
  case "$1" in
  "l") cd ~/$pot_path/ldmc4a2017b ;;
  "s") cd ~/$pot_path/twoc3 ;;
  "s4") cd ~/$pot_path/twoc3_4 ;;
  "d") cd ~/$pot_path/data5f ;;
  "dd") cd ~/$pot_path/data5f/Diabatic ;;
    # ----Add Karpov group TCSMcode-----
  "k") cd ~/$pot_path/TCSM4aun_Linux ;;
    # ----add_potential_for_yamasaki-------------
  "ly") cd ~/$poty_path/ldmc5next ;;
  "sy") cd ~/$poty_path/twoc5 ;;
  "dy") cd ~/$poty_path/data5f ;;
    # --------------------------------------------
  *)
    echo "USAGE: pot [OPTION]"
    echo "[OPTION]  l - liquid, s -shell, d - data, dd - Diabatic"
    echo "[OPTION]  ly - liquid for Y's Potential, sy - shell for Same Potential"
    ;;
  esac
}
# function surv() {
#   case "$1" in
#   "") cd ~/code/survive ;;
#   "k") cd ~/code/survive/minato8k ;;
#   "t") cd ~/code/survive/minato8t ;;
#   *) {
#     echo "option list"
#     echo "none - Dir:survive , k - Dir:minato8k , t - Dir:minato8t"
#   } ;;
#   esac
# }

# function xtar (){
#     local opti=$1
#     local dirn=$2
#
#     case "$opti" in
#      "a" )  tar -cvf  $dirn.tar $dirn ;;     #normal tar
#      "g" )  tar -cvzf $dirn.tar.gz $dirn ;;  #tar plus zip
#      "b" )  tar -cvjf $dirn.tar.bz2 $dirn ;; #tar plus bz2
#      "x" )  tar -cvJf $dirn.tar.xz $dirn ;;  #tar plus xz(slow process, highly compress rate)
#      "e" )  tar -xvf $dirn ;; #Extraction
#       *  )  echo " =======ERROR!! CANNOT COMPRESS DIRECTORY!!======="
#             echo " =                                               ="
#             echo " =  CHECK DIRECTORY NAME, OPTION, AND FORMAT!!!  ="
#             echo " =                                               ="
#             echo " ================================================="
#             echo " option : a -> tar , g -> gz , b -> bz2 , x -> xz"
#             echo "          e -> Extract archive."
#             echo " Format -> gtar option 'DIRECTORY'"
#     esac
# }

# function bkillloop () {
#     local first=$1
#     local   end=$2
#     if [ $first -gt $end ]; then
#         local tmpvalue
#         tmpvalue=$first
#            first=$end
#              end=$tmpvalue
#         unset tmpvalue
#     fi
#     for num in $(seq $first $end)
#     do
#         bkill $num
#     done
# }
# function bashtemp() {
#   local name=$1
#   local basef=$HOME/own/code/bashtemplate.sh
# 
#   if [ -z "$name" ]; then
#     echo "No argument"
#   elif [ -e $name ]; then
#     echo ""$name" already exists."
#   else
#     cp $basef $name
#     vi $name
#   fi
# }

# function findf() {
#   local file=$1
#   ls -lrt $(find -name $file)
# }
# function findg() {
#   local file=getloopnum
#   ls -lrt $(find -name $file)
# }

# function form() {
#   local form_dir=$HOME/lang2021/4dim/form/conf
#   local num=$1
#   case "$num" in
#   "1") cd "$form_dir"1 ;;
#   "2") cd "$form_dir"2 ;;
#   "3") cd "$form_dir"3 ;;
#   *) echo "Error! $num is undefined. you can use the numbers from 1 to 3." ;;
#   esac
# }

# function subjob1(){
#     local EXECUTABLE=$1
#     bsubomp -m vostok1 -n 1 -o wo ./$EXECUTABLE
# }

gen_comp() {
  NORMAL='ifort -parallel -O3 -xHost -ipo "$CODE".f -o $CODE'
  SHEBANG="#!/bin/bash"
  # ifort -override-limits -qopt-report=3 -qopt-report-phase=par -parallel -O3 -xHost -ipo langST1_14_ty1Mass.f -o langST1_12
  # cat <<EOF > test
  # test1
  # EOF
  echo $SHEBANG >comp.sh
  echo 'CODE=anu' >>comp.sh
  echo $NORMAL >>comp.sh
  chmod +x comp.sh
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
_fdepth() {
  set -f
  local target min max
  target="$1"
  min=$2
  max=$3

  set +f
  echo $target
  # set +f
  # if [ "$min" -gt "$max" ]; then
  # 	local tmp
  # 	tmp="$max"
  # 	max="$min"
  # 	min="$tmp"
  # fi
  # echo $target $min $max
  # find "$target" -mindepth "$min" -maxdepth "$max"
}

batchtemp() {
  sub=$1

  template=$HOME/own/job_script_ori.sh
  case $sub in
  "cp") cp "$template" "$PWD"/ ;;
  *) echo "$sub" does not exist ;;
  esac
}

# ------------------------------------------>
#          Git Functions
# ------------------------------------------>
# Git command
alias ga="git add"
alias gs="git status"
alias gf="git fetch"
alias gd="git diff"
# alias gme="git merge origin/$(git rev-parse --abbrev-ref HEAD)"
# alias gme="git merge origin/main"
alias gcm="git commit -a -m"
alias gp="git push"
alias gpl="git pull"

# Git commit and push currect branch on remote env.
_gcpu() {
  NOW_BRANCH=$(git rev-parse --abbrev-ref HEAD)
  git commit
  git push -u origin "$NOW_BRANCH"
}
