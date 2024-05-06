# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
# if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
#   source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
# fi

# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#                     zshrc
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

### Added by Zinit's installer
# if [[ ! -f $HOME/.zinit/bin/zinit.zsh ]]; then
#     print -P "%F{33}▓▒░ %F{220}Installing %F{33}DHARMA%F{220} Initiative Plugin Manager (%F{33}zdharma/zinit%F{220})…%f"
#     command mkdir -p "$HOME/.zinit" && command chmod g-rwX "$HOME/.zinit"
#     command git clone https://github.com/zdharma-continuum/zinit "$HOME/.zinit/bin" && \
#         print -P "%F{33}▓▒░ %F{34}Installation successful.%f%b" || \
#         print -P "%F{160}▓▒░ The clone has failed.%f%b"
# fi
# 
# source "$HOME/.zinit/bin/zinit.zsh"
# autoload -Uz _zinit
# (( ${+_comps} )) && _comps[zinit]=_zinit

# Load sheldon (Sheldon is shell plugin manager.)
eval "$(sheldon source)"

# ------------UPPER ZINIT----------------------------

# Load *.zsh files in $HOME/.zsh directory.
# ZSHHOME="${HOME}/.zsh"
# if [ -d $ZSHHOME -a -r $ZSHHOME -a \
#      -x $ZSHHOME ]; then
#     for i in $ZSHHOME/*; do
# 	[[ ${i##*/} = *.zsh ]] &&
# 		[ \( -f $i -o -h $d \) -a -r $i ] && . $i
#     done
# fi

# ---------------------------------------------------

# ---------zinit plugin--------------->
# zinit load olets/zsh-abbr   # Use abbreviations.
# [[ $(type abbr > /dev/null 2>&1) ]] && abbr import-aliases -S >/dev/null
# abbr import-aliases -S >/dev/null
# zinit load greymd/docker-zsh-completion # docker completion
# ------Plugin ------<

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
# [[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
