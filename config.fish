#alias
alias cp "cp -b -i"
#alias bh "bhosts"
#alias bj "bjobs"
alias vbp "vi ~/.bash_profile"
#alias sbp "source ~/.bash_profile"
alias vvmrc "vi ~/.vimrc"
alias svmrc "source ~/.vimrc"
alias et "exit"
#alias lqm "cd ~/lang2018/pot2017/ldmc4a2017b"
#alias shm "cd ~/lang2018/pot2017/twoc3"
#alias SHELL "sh shtwoc1"
alias rl "readlink -f"
alias dc "cd"
alias sl "ls"
#alias InT "vi input_tran.dat"
#alias cdab "cd ~/"
#alias Nist "cd /home/takagi/proj/nishi/run_test"
#alias NHP "nohup ./job.sh &"
alias memo "vi ~/dotfiles/.memo"
alias share "cd ~/cloud/share"
alias dein "cd ~/.cache/dein/repos/github.com"
alias plugin "cd ~/.cache/userconfig"
alias vimaf "cd .vim/after/syntax"
alias vostok "ssh vostok"
alias cdrive "cd /mnt/c/Users/shiny"
alias hdd "cd /mnt/e"
alias ssd "cd /mnt/g"

#NEW Alias
alias vfp "vi ~/.config/fish/config.fish"
alias sfp "source ~/.config/fish/config.fish"
alias github "open https://github.com"

#Function
function hoge
  echo hoge function
end

#pronpt
alias fishp "vi ~/.config/fish/functions/fish_prompt.fish"
#function fish_prompt
#  set_color green
#  echo (pwd) "> "
# set_color normal
#end

function fuga
# case $argv in:
# "2" ) echo "fuga";;
# esac
  echo fuga
end

#test
set unko "$HOME"
alias unko "echo $unko"
