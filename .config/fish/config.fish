#
# Fish configure
#

if status is-interactive
    # Commands to run in interactive sessions can go here
end

# -----------------------------
# Alias
# -----------------------------
# local Alias
alias ls='ls --color=auto'
alias lst='ls -ltr'
alias la='ls -la'
alias ll='ls -l'
alias ltr='ll -rt'
alias lh='ls -lh'

#------git------------
alias gs='git status'
alias ga='git add'
alias gb='git branch'
alias gco='git checkout'
alias gcm='git commit -a -m'
alias gp='git push'
alias gpm='gp origin master'

# Vim
alias vi='vim'
alias vr='vi ~/.vimrc'
alias nvr 'nvim ~/.config/nvim/init.vim'

# fish
alias vf='vim ~/.config/fish/config.fish'
alias sf='source ~/.config/fish/config.fish'
alias cf='cd ~/.config/fish'
alias cgoogle='cd /mnt/google/マイドライブ'

# For wsl
alias open='wsl-open'

# Open Browser
alias github='open https://www.github.com'
alias ggr="open http://google.com/"
alias tube="open https://www.youtube.com"
alias qiita="open https://qiita.com"

# TeX
alias lmk="latexmk -pvc -output-directory=out"
alias lmkc="latexmk "
alias lmklua="latexmk -gg -pdflua -pvc -output-directory=out"

# Set vim key-bind for fish
fish_vi_key_bindings

#------------------------------
#     dircolors
#------------------------------
if test -f ~/.dircolors-solarized/dircolors.ansi-dark_taka
  eval (dircolors -c ~/.dircolors-solarized/dircolors.ansi-dark_taka)
end

#-----------------------
#       For pyenv
#-----------------------
status is-login; and pyenv init --path | source
status is-interactive; and pyenv init - | source
#----------------------
#       For asdf
#----------------------
source ~/.asdf/asdf.fish

# environmental path
# set -x PATH /home/linuxbrew/.linuxbrew/bin $PATH
# Universal variables
# set -U fish_user_paths /home/linuxbrew/.linuxbrew/bin $fish_user_paths


# SSH agent
#set SSH_AGENT_FILE "$HOME/.ssh/ssh_agent"
#test -f $SSH_AGENT_FILE; and source $SSH_AGENT_FILE > /dev/null 2>&1
#if not ssh-add -l > /dev/null 2>&1
#  if not ps -ef | grep -v grep | grep ssh-agent
#    ssh-agent -c > $SSH_AGENT_FILE 2>&1
#  end
#  source $SSH_AGENT_FILE > /dev/null 2>&1
#  find $HOME/.ssh -name id_rsa_vostok2 | xargs ssh-add
#end
