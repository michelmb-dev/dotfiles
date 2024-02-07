#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias c='clear'
alias ls='ls --color=auto'
alias ll='ls -la --color=auto'
alias nv='nvim'
alias grep='grep --color=auto'
PS1='[\u@\h \W]\$ '

eval "$(starship init bash)"
source /usr/share/nvm/init-nvm.sh
