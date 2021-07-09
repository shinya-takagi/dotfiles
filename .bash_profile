# .bash_profile

# Get the aliases and functions
if [ -f ~/.bashrc ]; then
	. ~/.bashrc
fi

# User specific environment and startup programs

#PATH=$PATH:$HOME/bin
PATH="$HOME/usr/bin:$PATH"
PATH="$HOME/own/code:$PATH"

export PATH

#alias
alias cp="cp -b -i"
alias dcp="cp -rbi"
alias drm="rm -rv"
alias bh="bhosts"
alias bhop='bhosts | grep -v clo | grep -v una'
alias lastt='last -8 takagi'
alias bj="bjobs"
alias bjall="bjobs -u all"
alias vbp="vim ~/.bash_profile"
alias sbp="source ~/.bash_profile"
alias vvmrc="vi ~/.vimrc"
alias svmrc="source ~/.vimrc"
alias et="exit"
#alias lqm="cd ~/$pot_path/ldmc4a2017b"
#alias shm="cd ~/$pot_path/twoc3"
#alias SHELL="sh shtwoc1"
alias rl="readlink -f"
alias dc="cd"
alias sl="ls"
#alias InT="vi input_tran.dat" 
#alias cdab="cd ~/"
#alias Nist="cd /home/takagi/proj/nishi/run_test"
#alias NHP="nohup ./job.sh &"
alias memo="vi ~/own/memo.c"
alias share="cd ~/cloud/share"
alias ll="ls -l"
alias llh="ls -lh"
alias la="ls -a" 
alias lt="llh -t"
alias ltr="llh -rt"
alias lls="llh -S"
alias llsr="llh -Sr"
alias ci="vi" 
alias dd=:
alias ftvim="vi ~/.vim/ftplugin/fortran.vim"
alias cmd="cp ~/own/cmd . ; mv cmd $1"  #option is a file name.
#alias savecode="cp `echo $1` ~/own/code/"
alias testecho="echo $1"
alias allcp="cp * ~/own/cmd"
alias calcune="cd ~/calcu/langne"
 alias epsilon="vi ~/$pot_path/ldmc4a2017b/epsilon_t"
alias 2nd="cd ~/langfu/test276"
alias 2ndp="cd ~/langfu/2ndp"
alias 2ndp2="cd ~/langfu/2ndp2"
alias 2ndnevp="cd ~/langfu/nevp"
alias 2ndls="cd ~/calcu/2ndp ; ls"
alias amano="cd $HOME/amano2021/lang2021/"
alias tt="./~own/timetable.sh"
alias zda="vi ~/own/ZDA.dat"
#alias zda="./~/own/zda"
alias dvi="vi -O"

alias 4dim="cd /home/takagi/4dim/4dt/lang25_26"
alias ama="cd $HOME/amano2021/lang2021/langtrant"
alias code="cd $HOME/own/code"
alias vanu="vi anu99k58.f"

# Rotation directory
ROTUT=~/langfi/Tanaka/U/rot
alias rotu="cd $ROTUT"

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
hoge() {
echo "This is function hoge"
}
tt () {
nowd=`pwd`
cd ~/own
./timetable.sh
cd $nowd
}
sortsamx () {
    codepath=$HOME/own/code
    sortfile=sortsam
    samnum=`seq 1 8`
    
    cp $codepath/$sortfile .
    ./$sortfile
    
    for num in $samnum;do
        mv aasam$num aasam"$num"_bef
        mv aasam"$num"_sort aasam$num
    done
    
    rm $sortfile
}
nis(){
case "$1" in
 "rl"	 ) cd ~/proj/nishi/run_test/res/ ; rl seed.out ; rl fabund_a.dat ;;
 "ll"	 ) cd ~/proj/nishi/run_test/in ; ll ;;
 "run" 	 ) cd ~/proj/nishi/run_test ; NHP ;;
 "viexe" ) vi ~/proj/nishi/run_test/exec_all.sh ;;
 *	 ) cd /home/takagi/proj/nishi/run_test
esac
}
LangNE(){
lang=~/langne
case "$1" in
 ""    ) cd $lang ;;
 "ma"  ) cd $lang/klang6a/ ;;
 "mai" ) vi $lang/klang6a/ate114v4a ;;
 "auto") cd $lang/auto ;;
 "2ndp") cd $lang/2ndp ;;

 *	) {	echo "			Parameter List"
 		echo "m-main , s-sub , i-input(exe) , a-304~292 b-298~289 c-292~289"
		echo "() - langne directory     auto - automatic"
	}
esac
}
langfi(){
case "$1" in
 "auto" ) cd ~/langfi/langfiss ;;
 "m" ) cd ~/langfi/langfm3a ;;
 "m92" ) vi ~/langfi/langfm3a/ate92tmd4 ;;
 "m10" ) vi ~/langfi/langfm3a/ate100tmd4 ;;
 "u" ) cd ~/langfi/langfm3aura ;;
 "u92" ) vi ~/langfi/langfm3aura/ate92tmd4 ;;
 "u10" ) vi ~/langfi/langfm3aura/ate100tmd4 ;;
 "s" ) cd ~/langfi/langfm3asub ;;
 "s92" ) vi ~/langfi/langfm3asub/ate92tmd4 ;;
 "s10" ) vi ~/langfi/langfm3asub/ate100tmd4 ;;
 *   ) { echo "fi - fission , h -heavy(fusion) , e - input_exe , 92 - < Z=100 , 10 - > Z=100 "
         echo "auto - langfiss"
}
esac
}
langfu(){
case "$1" in
 "t" ) cd ~/langfu/test276 ;;
 "ti" ) vi ~/langfu/test276/atet6m ;;
 "auto"  ) cd ~/langfu/lang276/ ;;
# "" ) vi ~/langfu/klang6/ate114v4a ;;
#"u" ) cd ~/langfi/langfm3aura ;;
#"u92" ) vi ~/langfi/langfm3aura/ate92tmd4 ;;
# "u10" ) vi ~/langfi/langfm3aura/ate100tmd4 ;;
# "s" ) cd ~/langfi/langfm3asub ;;
# "s92" ) vi ~/langfi/langfm3asub/ate92tmd4 ;;
# "s10" ) vi ~/langfi/langfm3asub/ate100tmd4 ;;
 *   ) echo "t - Dir:test276, i - input_exe, auto - Dir:lang276(auto calculation)"
esac
}
pot(){
pot_path=lang2018/pot2017
case "$1" in
 "l" ) cd ~/$pot_path/ldmc4a2017b ;;
 "s" ) cd ~/$pot_path/twoc3 ;;
 "s4" ) cd ~/$pot_path/twoc3_4 ;;
 "d" ) cd ~/$pot_path/data5f ;;
"dd" ) cd ~/$pot_path/data5f/Diabatic ;;
"li" ) vi ~/$pot_path/ldmc4a2017b/input1.dat ;;
"le" ) sh ~/$pot_path/ldmc4a2017b/ate5 & ;;
"si" ) vi ~/$pot_path/twoc3/oin.dat ;;
"se" ) sh ~/$pot_path/twoc3/shtwoc1 ;;
 *   ) echo "l - liquid , s -shell , d - data , i - InputData , e - execute "
 	echo "dd - Diabatic"
esac
}
statis(){
case "$1" in
 ""  ) cd ~/statis ;;
 "k" ) cd ~/statis/minato8k ;;
 "t" ) cd ~/statis/minato8t ;;
  *  ) { echo "option list"
 	 echo "none - Dir:statis , k - Dir:minato8k , t - Dir:minato8t"
	}
esac
}

xtar (){
opti=$1
dirn=$2

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

findf () {
file=$1
ls -lrt $(find -name $file)
}


