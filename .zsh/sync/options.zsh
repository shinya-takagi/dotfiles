# -----------------------------
#         General
# -----------------------------
autoload -Uz colors ; colors    # Use colors
export EDITOR=nvim               # Change an editor as vim.
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

# -----------------------------
#   Key Binding
# -----------------------------
# vim like
bindkey -v
bindkey -M viins 'jj' vi-cmd-mode   # Back to Normal with jj

# -----------------------------
#     History
# -----------------------------
# Basic
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

# --------Evaluation of github-cli completion------->
[[ $(type gh > /dev/null 2>&1) ]] && eval "$(gh completion -s zsh)"

# Dotfile manager "dot"
if [ ! -d $HOME/.dot ]; then
    git clone https://github.com/ssh0/dot "$HOME"/.dot

fi
source $HOME/.dot/dot.sh
fpath=($HOME/.dot $fpath)
fpath+=$HOME/.zsh/function

#----------------------
function Terminal_Prompts(){
    #--------Powerline-------------->
    # Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
    # Initialization code that may require console input (password prompts, [y/n]
    # confirmations, etc.) must go above this block; everything else may go below.
    if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
      source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
    fi
    # Adopt powerlevel10k for powerline.
    if [ -e ~/powerlevel10k/powerlevel10k.zsh-theme ]; then
        source  ~/powerlevel10k/powerlevel10k.zsh-theme
    else
        git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ~/powerlevel10k
        source  ~/powerlevel10k/powerlevel10k.zsh-theme
    fi
    # To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
    [[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
    #-----PROMPT--------------------<
}


# OS Machine Dependence
if [ "$(uname -s)" = "Linux" ]; then
    # Terminal Setting
    Terminal_Prompts
    # Keyboard automatic to disable Caps Lock
    [[ $(type setxkbmap > /dev/null 2>&1) ]] && setxkbmap -option ctrl:nocaps
    # -----Display for Xserver------------->
    export DISPLAY=:0.0 
    # -----Xserver---------<
    # Wine setting
    export WINEARCH="win64"
    if [ $WINEARCH = "win32" ]; then
      export WINEPREFIX="$HOME"/.win32
    else
      export WINEPREFIX="$HOME"/.win64
    fi
elif [ "$(uname -s)" = "Darwin" ]; then
    # Terminal Dependence
    if [[ $TERM_PROGRAM != "WarpTerminal" ]]; then
        Terminal_Prompts
    else
        eval "$(starship init zsh)"
    fi
fi
