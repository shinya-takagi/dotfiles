
#---Basic Alias---
alias cp "cp -b -i"
alias vbp "vi ~/.bash_profile"
alias sbp "source ~/.bash_profile"
alias vvmrc "vi ~/.vimrc"
alias svmrc "source ~/.vimrc"
alias et "exit"
alias rl "readlink -f"
alias dc "cd"
alias sl "ls"
alias memo "vi ~/dotfiles/.memo"
alias dein "cd ~/.cache/dein/repos/github.com"
alias plugin "cd ~/.cache/userconfig"
alias vimaf "cd .vim/after/syntax"
alias vostok "ssh vostok"
alias vfp "vi ~/.config/fish/config.fish"
alias sfp "source ~/.config/fish/config.fish"
#---------------

#---Aias for vostok---
#alias bh "bhosts"
#alias bj "bjobs"
#alias lqm "cd ~/lang2018/pot2017/ldmc4a2017b"
#alias shm "cd ~/lang2018/pot2017/twoc3"
#alias SHELL "sh shtwoc1"
#alias InT "vi input_tran.dat"
#alias cdab "cd ~/"
#alias Nist "cd /home/takagi/proj/nishi/run_test"
#alias NHP "nohup ./job.sh &"
#alias share "cd ~/cloud/share"
#---------------------

#---ALIAS FOR Ubuntu---
alias cdrive "cd /mnt/c/Users/shiny"
alias hdd "cd /mnt/e"
alias ssd "cd /mnt/g"
#----------------------

#---ALIAS-FOR-Mac---
alias mac 'cd ~/develop'
alias pyy 'cd ~/develop/python'
alias ggr 'open http://google.com/'
alias tube 'open https://www.youtube.com' 
alias github 'open https://www.github.com'
alias twit 'open https://www.twitter.com'
alias insta 'open https://www.instagram.com'
alias qiita 'open https://qiita.com'
alias ql 'qlmanage -p'
alias spvim 'open https://spacevim.org/documentation/' #Spacevim document
alias weather 'curl -4 http://wttr.in/osaka'  #show weather
alias te_ 'trans {en=ja}' #英→日
alias tj_ 'trans {ja=en}' #日→英
alias memo 'vi ~/develop/codes/memo'

#-----IF U NEED MORE ALIASES, ADD TO UPSIDE-----

#------------------------------------------------
#     Functions 
#------------------------------------------------
function hoge
  echo hoge function
end

function ifort
  set sorc $argv[1]
  set exec $argv[2]
  sh ~/code/ifort.sh $sorc $exec
end

function mkhtml
  set md $argv[1]
  set ht $argv[2]
  showdown makehtml -i $md -o $ht
end

function tubedl
  set url $argv[1]
  set sav $argv[2]
  set dir /mnt/e/MyData/VIDEO/youtube-dl/$sav

  youtube-dl "$url"
  mkdir -p $dir
  mv *.mp4 $dir
end

#USE SWITCH SENTENCE
#function github

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
