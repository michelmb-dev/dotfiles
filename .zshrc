#!/usr/bin/env zsh


HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt INC_APPEND_HISTORY EXTENDED_HISTORY HIST_IGNORE_DUPS

# COMPLETION
autoload -U compinit
compinit
zstyle ':completion:*:descriptions' format '%U%B%d%b%u'
zstyle ':completion:*:warnings' format '%BSorry, no matches for: %d%b'
zstyle ':completion:*:sudo:*' command-path /usr/local/sbin /usr/local/bin /usr/sbin /usr/bin /sbin /bin /usr/X11R6/bin

# CREATE CACHE FOR COMPLETION
zstyle ':completion:*' use-cache on
zstyle ':completion:*' cache-path ~/.zsh_cache

# COMPLETION FOR CMD kill and killall
zstyle ':completion:*:processes' command 'ps -ax'
zstyle ':completion:*:processes-names' command 'ps -aeo comm='
zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#)*=0=01;31'
zstyle ':completion:*:*:kill:*' menu yes select
zstyle ':completion:*:*:killall:*:processes-names' list-colors '=(#b) #([0-9]#)*=0=01;31'
zstyle ':completion:*:*:killall:*' menu yes select

zmodload zsh/complist
setopt extendedglob
zstyle ':completion:*:*:kill:*:processes' list-colors "=(#b) #([0-9]#)*=36=31"

# CMD CORRECTION
setopt correctall

# ALIAS
alias ls='ls --color=auto'
alias ll='ls --color=auto -lh'
alias lll='ls --color=auto -lh | less'
# marre de se faire corriger par zsh ;)
alias xs='cd'
alias sl='ls'
# mplayer en plein framme buffer ;)
alias mplayerfb='mplayer -vo fbdev -vf scale=1024:768'
# Un grep avec des couleurs :
export GREP_COLOR=mt=31
alias grep='grep --color=auto'
alias -g G=' | grep '
# Créer dossier avec parents si non existants en mode verbose
alias mkdir='mkdir -pv'
# nettoyer l'écran
alias c='clear'
# xte lancera un xterm qui ne se fermera pas si on ferme le terminal
alias xte='nohup xterm &'
# erreur système
alias err='journalctl -p 3 -xb'
# Mise à jour
alias maj='sudo pacman -Syu'
# voir son adresse IP
alias myip='curl ipv4.icanhazip.com'
# wget en couleur
alias wget='wget -c'
# processus en cours
alias ps='ps auxf'
# Mémoire dispo
alias free='free -mt'

# un VRAI éditeur de texte ;)
export EDITOR=/usr/bin/vim

#BINDINGS KEYS
bindkey "^[[7~" beginning-of-line
bindkey "\e[H" beginning-of-line 
bindkey "\e[F" end-of-line 
bindkey "\e[F" end-of-line 
bindkey "^[[2~" overwrite-mode
bindkey "\e[3~" delete-char
bindkey "^F" history-incremental-search-backward
bindkey "^[Od" backward-word
bindkey "^[Oc" forward-word
bindkey "^[[3^" backward-kill-line
bindkey "^[[5^" up-line-or-history
bindkey "^[[6^" down-line-or-history
bindkey "^[[A" up-line-or-search
bindkey "^[[B" down-line-or-search

# SOURCES
source '/home/michel/.config/zsh/themes/catppuccin_mocha-zsh-syntax-highlighting.zsh'
source '/usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh'
source '/usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh'
source '/usr/share/nvm/init-nvm.sh'

# PROMPT
eval "$(starship init zsh)"

# tabtab source for packages
# uninstall by removing these lines
[[ -f ~/.config/tabtab/zsh/__tabtab.zsh ]] && . ~/.config/tabtab/zsh/__tabtab.zsh || true

export ANDROID_HOME=~/Android/Sdk
alias dotfiles='/usr/bin/git --git-dir=/home/michel/.dotfiles/ --work-tree=/home/michel'
