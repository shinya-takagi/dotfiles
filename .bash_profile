# .bash_profile

# Get the aliases and functions
if [ -f ~/.bashrc ]; then
	. ~/.bashrc
fi

# User specific environment and startup programs

PATH=$PATH:$HOME/bin

export PATH

#alias
alias cp="cp -b -i"
alias bh="bhosts"
alias bj="bjobs"
alias vbp="vi ~/.bash_profile"
alias sbp="source ~/.bash_profile"
alias vvmrc="vi ~/.vimrc"
alias svmrc="source ~/.vimrc"
alias et="exit"
#alias lqm="cd ~/lang2018/pot2017/ldmc4a2017b"
#alias shm="cd ~/lang2018/pot2017/twoc3"
alias SHELL="sh shtwoc1"
alias rl="readlink -f"
alias dc="cd"
alias sl="ls"
alias InT="vi input_tran.dat" 
alias cdab="cd ~/"
#alias Nist="cd /home/takagi/proj/nishi/run_test"
alias NHP="nohup ./job.sh &"
alias memo="vi ~/dotfiles/.memo"
alias share="cd ~/cloud/share"
alias dein="cd ~/.cache/dein/repos"

#function 
hoge() {
echo "This is function hoge"
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
case "$1" in
 ""    ) cd ~/langne/ ;;
 "ma"  ) cd ~/langne/klang6a/ ;;
 "mai" ) vi ~/langne/klang6a/ate114v4a ;;


 *	) {	echo "			Parameter List"
 		echo "m-main , s-sub , i-input(exe) , a-304~292 b-298~289 c-292~289"
		echo "() - langne directory"
	}
esac
}
langfi(){
case "$1" in
 "m" ) cd ~/langfi/langfm3a ;;
 "m92" ) vi ~/langfi/langfm3a/ate92tmd4 ;;
 "m10" ) vi ~/langfi/langfm3a/ate100tmd4 ;;
 "u" ) cd ~/langfi/langfm3aura ;;
 "u92" ) vi ~/langfi/langfm3aura/ate92tmd4 ;;
 "u10" ) vi ~/langfi/langfm3aura/ate100tmd4 ;;
 "s" ) cd ~/langfi/langfm3asub ;;
 "s92" ) vi ~/langfi/langfm3asub/ate92tmd4 ;;
 "s10" ) vi ~/langfi/langfm3asub/ate100tmd4 ;;
 *   ) echo "fi - fission , h -heavy(fusion) , e - input_exe , 92 - < Z=100 , 10 - > Z=100 "
esac
}
langfu(){
case "$1" in
 "t" ) cd ~/langfu/test276 ;;
 "ti" ) vi ~/langfu/test276/atet6m ;;
# "ma"  ) cd ~/langfu/klang6/ ;;
# "m10" ) vi ~/langfu/klang6/ate114v4a ;;
#"u" ) cd ~/langfi/langfm3aura ;;
#"u92" ) vi ~/langfi/langfm3aura/ate92tmd4 ;;
# "u10" ) vi ~/langfi/langfm3aura/ate100tmd4 ;;
# "s" ) cd ~/langfi/langfm3asub ;;
# "s92" ) vi ~/langfi/langfm3asub/ate92tmd4 ;;
# "s10" ) vi ~/langfi/langfm3asub/ate100tmd4 ;;
 *   ) echo "t - Dir:test276i - input_exe"
esac
}
pot(){
case "$1" in
 "l" ) cd ~/lang2018/pot2017/ldmc4a2017b ;;
 "s" ) cd ~/lang2018/pot2017/twoc3 ;;
 "d" ) cd ~/lang2018/pot2017/data5f ;;
"li" ) vi ~/lang2018/pot2017/ldmc4a2017b/input1.dat ;;
"le" ) sh ~/lang2018/pot2017/ldmc4a2017b/ate5 & ;;
"si" ) vi ~/lang2018/pot2017/twoc3/oin.dat ;;
"se" ) sh ~/lang2018/pot2017/twoc3/shtwoc1 ;;
 *   ) echo "l - liquid , s -shell , d - data , i - InputData"
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
