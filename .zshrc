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

# Adopt powerlevel10k for powerline.
if [ -e ~/powerlevel10k/powerlevel10k.zsh-theme ]; then
    source  ~/powerlevel10k/powerlevel10k.zsh-theme
else
    git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ~/powerlevel10k
    source  ~/powerlevel10k/powerlevel10k.zsh-theme
fi
# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
#-----PROMPT-----------------------------------<

#------------------------------
#     dircolors
#------------------------------
eval `dircolors ~/.dircolors-solarized/dircolors.ansi-dark_taka`
#=----Dircolors----------<
#-----Display for Xserver------------->
export DISPLAY=:0.0 
#export DISPLAY=$(cat /etc/resolv.conf | grep nameserver | awk '{print $2}'):0
#export DISPLAY=$(ipconfig.exe | grep IPv4 | grep -E '[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}' -o | head -2):0
#export DISPLAY=$(grep nameserver /etc/resolv.conf | sed 's/nameserver //'):0
#-----Xserver---------<
# Dotfile manager "dot"
if [ -d $HOME/.dot ]; then
    source $HOME/.dot/dot.sh
    fpath=($HOME/.dot $fpath)
fi

