# -------------------------------------
#       Setting for zsh
# -------------------------------------

### Added by Zinit's installer
if [[ ! -f $HOME/.zinit/bin/zinit.zsh ]]; then
    print -P "%F{33}▓▒░ %F{220}Installing %F{33}DHARMA%F{220} Initiative Plugin Manager (%F{33}zdharma/zinit%F{220})…%f"
    command mkdir -p "$HOME/.zinit" && command chmod g-rwX "$HOME/.zinit"
    command git clone https://github.com/zdharma-continuum/zinit "$HOME/.zinit/bin" && \
        print -P "%F{33}▓▒░ %F{34}Installation successful.%f%b" || \
        print -P "%F{160}▓▒░ The clone has failed.%f%b"
fi

source "$HOME/.zinit/bin/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

# ZINIT REPOSITORY REMOVED!!!!!!!!
# Load a few important annexes, without Turbo
# (this is currently required for annexes)
#zinit light-mode for \
#    zinit-zsh/z-a-rust \
#    zinit-zsh/z-a-as-monitor \
#    zinit-zsh/z-a-patch-dl \
#    zinit-zsh/z-a-bin-gem-node

### End of Zinit's installer chunk

# ------------UPPER ZINIT----------------------------

ZSHHOME="${HOME}/.zsh"
if [ -d $ZSHHOME -a -r $ZSHHOME -a \
     -x $ZSHHOME ]; then
    for i in $ZSHHOME/*; do
	[[ ${i##*/} = *.zsh ]] &&
		[ \( -f $i -o -h $d \) -a -r $i ] && . $i
    done
fi
# ---------------------------------------------------

# -----------------------------
#         General
# -----------------------------
autoload -Uz colors ; colors    # Use colors
export EDITOR=vim               # Change an editor as vim.
#setopt IGNOREEOF               # Ignore logout with Ctrl + D 
setopt auto_pushd               # Automatic addition of directory as cd.
setopt pushd_ignore_dups        # Ignore same directory to add in stack.
setopt no_flow_control          # Disable flow control.
setopt extended_glob            # Use wildcard glob.
setopt auto_cd                  # Change directory without cd.
#setopt xtrace                  # Show command line when you run.
setopt auto_pushd               # Run pushd automatically.
setopt pushd_ignore_dups        # Ignore same pushd.
setopt no_beep                  # Disable beep.
setopt auto_param_keys          # complete () automatically.
setopt notify                   # Notify the condition change of bg process.
setopt print_eight_bit          # Can print 8 bit words.
setopt print_exit_value         # Print states when it ends excecpt status 0.
setopt mark_dirs                # Add / on expansion of file names.
setopt correct                  # Check spelling on command line.
setopt correct_all              # Check all spell on command line.
setopt no_clobber               # Ban overwrite with redirect.
setopt noautoremoveslash        # Don't remove a slash of the path.
export RSYNC_RSH=ssh            # use ssh on rsync
# ---------Other------------->
umask 022
ulimit -c 0
# ----Automatic SSH Connection, but it cannot use.> 
# TEST SSH-AGENT WITH ENV SSH_ASKPASS
#eval `ssh-agent` > /dev/null 2>&1
#export DISPLAY=:0.0 
#eval `ssh-add $HOME/.ssh/id_rsa_vostok2 > /dev/null 2>&1`
#setsid ssh-add $HOME/.ssh/id_rsa_vostok2 </dev/null
#ssh vostok

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi
# -----------------------------
#   Key Binding
# -----------------------------
# emacsキーバインド
#bindkey -e
# viキーバインド
bindkey -v
bindkey -M viins 'jj' vi-cmd-mode   # Back to Normal with jj
# -----------------------------
#     Completion
# -----------------------------
## Self-made completion
fpath=($HOME/.zsh/functions $fpath)
## コマンド補完
zinit ice wait'0'; zinit light zsh-users/zsh-completions
autoload -Uz compinit && compinit
# autoload -Uz _mcf
# ps コマンドのプロセス名補完
zstyle ':completion:*:processes' command 'ps x -o pid,s,args'
## 補完で小文字でも大文字にマッチさせる
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'
## 補完候補を一覧表示したとき、Tabや矢印で選択できるようにする
zstyle ':completion:*:default' menu select=1 
## シンタックスハイライト
zinit light zsh-users/zsh-syntax-highlighting
## 履歴補完
zinit light zsh-users/zsh-autosuggestions
# sudo の後ろでコマンド名を補完する
zstyle ':completion:*:sudo:*' command-path /usr/local/sbin /usr/local/bin \
                   /usr/sbin /usr/bin /sbin /bin /usr/X11R6/bin
# 補完の選択を楽にする
zstyle ':completion:*' menu select
# 補完候補をできるだけ詰めて表示する
setopt list_packed
# 補完候補にファイルの種類も表示する
#setopt list_types
#
# 色の設定
if [ -z $COLORS_ENV ]; then
  export COLORS_ENV=ON
  export LSCOLORS=Exfxcxdxbxegedabagacad
  # 補完時の色設定
  export LS_COLORS='di=01;34:ln=01;35:so=01;32:ex=01;31:bd=46;34:cd=43;34:su=41;30:sg=46;30:tw=42;30:ow=43;30'
fi
# キャッシュの利用による補完の高速化
zstyle ':completion::complete:*' use-cache true
# 補完候補に色つける
autoload -U colors ; colors ; zstyle ':completion:*' list-colors "${LS_COLORS}"
#zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'
# manの補完をセクション番号別に表示させる
zstyle ':completion:*:manuals' separate-sections true
# --prefix=/usr などの = 以降でも補完
setopt magic_equal_subst

# -----------------------------
#     History
# -----------------------------
# 基本設定
HISTFILE=$HOME/.zsh-history
HISTSIZE=100000
SAVEHIST=1000000
# ヒストリーに重複を表示しない
setopt histignorealldups
# 他のターミナルとヒストリーを共有
setopt share_history
# すでにhistoryにあるコマンドは残さない
setopt hist_ignore_all_dups
# historyに日付を表示
alias h='fc -lt '%F %T' 1'
# ヒストリに保存するときに余分なスペースを削除する
setopt hist_reduce_blanks
# 履歴をすぐに追加する
setopt inc_append_history
# ヒストリを呼び出してから実行する間に一旦編集できる状態になる
setopt hist_verify
# -----------------------------
#     Prompt
# -----------------------------
# %M    ホスト名
# %m    ホスト名
# %d    カレントディレクトリ(フルパス)
# %~    カレントディレクトリ(フルパス2)
# %C    カレントディレクトリ(相対パス)
# %c    カレントディレクトリ(相対パス)
# %n    ユーザ名
# %#    ユーザ種別
# %?    直前のコマンドの戻り値
# %D    日付(yy-mm-dd)
# %W    日付(yy/mm/dd)
# %w    日付(day dd)
# %*    時間(hh:flag_mm:ss)
# %T    時間(hh:mm)
# %t    時間(hh:mm(am/pm))
#
# function powerline_precmd() {
#     PS1="$($GOPATH/bin/powerline-go -error $? -jobs ${${(%):%j}:-0})"
# 
#     # Uncomment the following line to automatically clear errors after showing
#     # them once. This not only clears the error for powerline-go, but also for
#     # everything else you run in that shell. Don't enable this if you're not
#     # sure this is what you want.
# 
#     #set "?"
# }
# 
# function install_powerline_precmd() {
#   for s in "${precmd_functions[@]}"; do
#     if [ "$s" = "powerline_precmd" ]; then
#       return
#     fi
#   done
#   precmd_functions+=(powerline_precmd)
# }
# 
# if [ "$TERM" != "linux" ] && [ -f "$GOPATH/bin/powerline-go" ]; then
#     install_powerline_precmd
# fi
#------Show Prompt of git infomation-------
# function rprompt-git-current-branch {
#   local branch_name st branch_status
#   
# # branch='\ue0a0'
# # color='%{\e[38;5;' #  文字色を設定
# # green='114m%}'
# # red='001m%}'
# # yellow='227m%}'
# # blue='033m%}'
# # reset='%{\e[0m%}'   # reset
#   
#   if [ ! -e  ".git" ]; then
#     # git 管理されていないディレクトリは何も返さない
#     return
#   fi
#   branch_name=`git rev-parse --abbrev-ref HEAD 2> /dev/null`
#   st=`git status 2> /dev/null`
#   if [[ -n `echo "$st" | grep "^nothing to"` ]]; then
#     # 全て commit されてクリーンな状態
# #   branch_status="${color}${green}${branch}"
#     branch_status="%F{green}"
# #   branch_status="%{$fg[green]}%}%{${reset_color}%}"
#   elif [[ -n `echo "$st" | grep "^Untracked files"` ]]; then
#     # git 管理されていないファイルがある状態
# #   branch_status="${color}${red}${branch}?"
#     branch_status="%F{red}manage"
#   elif [[ -n `echo "$st" | grep "^Changes not staged for commit"` ]]; then
#     # git add されていないファイルがある状態
# #   branch_status="${color}${red}${branch}+"
#     branch_status="%F{red}add"
#   elif [[ -n `echo "$st" | grep "^Changes to be committed"` ]]; then
#     # git commit されていないファイルがある状態
# #   branch_status="${color}${yellow}${branch}!"
#     branch_status="%F{yellow}commit"
#   elif [[ -n `echo "$st" | grep "^rebase in progress"` ]]; then
#     # コンフリクトが起こった状態
# #   echo "${color}${red}${branch}!(no branch)${reset}"
#     echo "%F{red}!(no branch)"
#     return
#   else
#     # 上記以外の状態の場合
# #   branch_status="${color}${blue}${branch}"
#     branch_status="%F{blue}"
#   fi
#   # ブランチ名を色付きで表示する
# # echo "${branch_status}$branch_name${reset}"
#   echo "${branch_status}[$branch_name]%f"
# # echo -e "${branch_status}[$branch_name]%f%T"
# }
#  
# # プロンプトが表示されるたびにプロンプト文字列を評価、置換する
# setopt prompt_subst
#  
# # プロンプトの右側にメソッドの結果を表示させる
# zle -N rptompy-git-current-branch 
# RPROMPT='`rprompt-git-current-branch`'
# # 
# # # ------END Git prompt---------
# # 
# # # -----new prompt setting-------
#  autoload -Uz add-zsh-hook
#  autoload -Uz terminfo
#  
#  # vim mode set 2 left-down position
#  terminfo_down_sc=$terminfo[cud1]$terminfo[cud1]$terminfo[cuu1]$terminfo[cuu1]$terminfo[sc]$terminfo[cud1]$terminfo[cud1]
#  function left_down_prompt_preexec() {
#      print -rn -- $terminfo[el]
#  }
#  add-zsh-hook preexec left_down_prompt_preexec
#  
#  function zle-keymap-select zle-line-init zle-line-finish
#  {
#  # local exit_code_check
#      case $KEYMAP in
#          main|viins)
#              PROMPT_2="$fg[cyan]-- INSERT --$reset_color"
#              ;;
#          vicmd)
#              PROMPT_2="$fg[white]-- NORMAL --$reset_color"
#              ;;
#  #       vivis|vivli)
#  #           PROMPT_2="$fg[yellow]-- VISUAL --$reset_color"
#  #           ;;
#      esac
#      # example of show exit status on prompt
#  #   %{$fg[black]%(?.$bg[green].$bg[red])%}<%?>
#  #   PROMPT="%{$terminfo_down_sc$PROMPT_2$terminfo[rc]%}[%(?.%{${fg[green]}%}.%{${fg[red]}%})%~%{${reset_color}%}]
#      PROMPT="%{$terminfo_down_sc$PROMPT_2$terminfo[rc]%}[%T]|[%(?.%{${fg[green]}%}.%{${fg[red]}%})%~%{${reset_color}%}]
#  %{%(?.$fg[green].$fg[red])%}<%?>%{${reset_color}%} %# "
#  # %{%(?.$fg[green].$fg[red])%}<%?>${reset_color} %# "
#  # <%{%(?.$fg[green].$fg[red])%}%?${reset_color}> %# "
#      zle reset-prompt
#  }
#  
#  zle -N zle-line-init
#  zle -N zle-line-finish
#  zle -N zle-keymap-select
#  zle -N edit-command-line

#------End new prompt setting-------

# ---Vim MODE CHECK-------
#+++++old++++++
# function zle-keymap-select {
#   VIM_NORMAL="%K{208}%F{black}⮀%k%f%K{208}%F{white} % NORMAL %k%f%K{black}%F{208}⮀%k%f"
#   VIM_INSERT="%K{075}%F{black}⮀%k%f%K{075}%F{white} % INSERT %k%f%K{black}%F{075}⮀%k%f"
#  VIMODE="${${KEYMAP/vicmd/$VIM_NORMAL}/(main|viins)/$VIM_INSERT}"
#  zle reset-prompt
# }
 
# zle -N zle-keymap-select
# PROMPT='%F{red}%~%f
# ${VIMODE}$ '
# ---old prompt setting---
#
# Adopt powerlevel10k for powerline.
source  ~/powerlevel10k/powerlevel10k.zsh-theme
# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
#-----PROMPT-----------------------------------<

#------------------------------
#     dircolors
#------------------------------
eval `dircolors ~/.dircolors-solarized/dircolors.ansi-dark_taka`
#=----Dircolors----------<
#-----Display for Xserver------------->
#export DISPLAY=$(cat /etc/resolv.conf | grep nameserver | awk '{print $2}'):0
#export DISPLAY=$(ipconfig.exe | grep IPv4 | grep -E '[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}' -o | head -2):0
#export DISPLAY=$(grep nameserver /etc/resolv.conf | sed 's/nameserver //'):0
#-----Xserver---------<
#

