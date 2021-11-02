set fish_function_path $fish_function_path "/usr/share/powerline/bindings/fish"
powerline-setup

#---Add PATH------
#set PATH  /opt/intel/compilers_and_libraries_2020.3.275/linux/bin /opt/intel/compilers_and_libraries_2020.3.275/linux/mpi/intel64/libfabric/bin /opt/intel/bin $PATH
set PATH $HOME/FISH $PATH
set PATH $HOME/codes $PATH
set PATH $HOME/intel/bin $PATH

#---TeX PATH------
set PATH /usr/local/texlive/2021/bin/x86_64-linux $PATH

#-----------------


#---Basic Alias---
alias cp "cp -b -i"
#alias vbp "vi ~/.bash_profile"
#alias sbp "source ~/.bash_profile"
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
alias ybdl "cd /mnt/e/Mydata/VIDEO/youtube-dl"
alias open "xdg-open"
#---------------

#------git------------
alias gs "git status"
alias ga "git add"

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

#---Call original shell scripts---
#set code_dir '$HOME/develop/code'
#------Ubuntu-----
 alias tubedl 'sh ~/codes/tube.sh'
 alias qrgen 'sh ~/codes/qrgen.sh'
 alias gethtml 'sh ~/codes/gethtml.sh'
 alias galdl 'sh ~/codes/gal-dl.sh'
 alias dirall 'sh ~/codes/dirtoall.sh'
 alias neeview '/mnt/c/"Program\ Files\ \(x86\)"/NeeLaboratory/NeeView/NeeView.exe &'
 alias bstnt '/mnt/c/Users/shiny/AppData/Local/boost/Boostnote.exe &'
 alias tbd 'youtube-dl'
#--------Mac------
#alias tubedl 'sh ~/develop/codes/tube.sh'
#alias qrgen 'sh ~/develop/codes/qrgen.sh'
#alias gethtml 'sh ~/develop/codes/gethtml.sh'
#---------------------------------

#---ALIAS FOR Ubuntu---
alias cdrive "cd /mnt/c/Users/shiny"
alias hdd "cd /mnt/e"
alias ssd "cd /mnt/g"
function gall
  set test1 $argv[1]
  switch $test1
  case sup
    open "https://github.com/mikf/gallery-dl/blob/master/docs/supportedsites.rst"
  case dir
    cd /mnt/e/MyData/Picture/gallery-dl
  case '*'
    echo "parameters"
    echo "sup -> open supportedsites. dir -> open saved directories."
  end
end
alias galdir "cd /mnt/e/MyData/Picture/gallery-dl"

# Watching progress of cp command.
alias cppg "cp $argv[1] $argv[2] & progress -mp %1"

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

#function ifort
#  set sorc $argv[1]
#  set exec $argv[2]
#  sh ~/code/ifort.sh $sorc $exec
#end

function mkhtml
  set md $argv[1]
  set ht $argv[2]
  showdown makehtml -i $md -o $ht
end

#function tubedl
#  set url $argv[1]
#  set sav $argv[2]
#  set dir /mnt/e/MyData/VIDEO/youtube-dl/$sav
#
#  youtube-dl "$url"
#  mkdir -p $dir
#  mv *.mp4 $dir
#end

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
