# -----------------------------
#     Completion(WIP)
# -----------------------------
autoload -Uz compinit
compinit -u
# ~~~ Start zsh-autocomplete ~~~
# zstyle ':completion:*'  list-colors '=*=90'
zstyle ':completion:*:parameters'  list-colors '=*=32'
zstyle ':completion:*:commands' list-colors '=*=1;31'
zstyle ':completion:*:builtins' list-colors '=*=1;38;5;142'
zstyle ':completion:*:aliases' list-colors '=*=2;38;5;128'
zstyle ':completion:*:*:kill:*' list-colors '=(#b) #([0-9]#)*( *[a-z])*=34=31=33'
zstyle ':completion:*:sudo:*' command-path /usr/local/sbin /usr/local/bin \
                   /usr/sbin /usr/bin /sbin /bin /usr/X11R6/bin
setopt list_types
# キャッシュの利用による補完の高速化
zstyle ':completion::complete:*' use-cache true
## ~~~ End zsh-autocomplete

# OrbStack completion
if (( $+commands[orbctl] )); then
  eval "$(orbctl completion zsh)"
  compdef _orb orbctl
  compdef _orb orb
fi
