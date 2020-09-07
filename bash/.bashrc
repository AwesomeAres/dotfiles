#misc settings for bash shell
shopt -s autocd
stty -ixon
set -o vi

#set infinite history
HISTFILESIZE= HISTSIZE=
#ignore repeated commands
export HISTCONTROL=ignoredups

#set prompt
export PS1="\[$(tput bold)\]\[$(tput setaf 1)\][\[$(tput setaf 3)\]\u\[$(tput setaf 2)\]@\[$(tput setaf 28)\]\h \[$(tput setaf 5)\]\W\[$(tput setaf 1)\]]\[$(tput setaf 7)\]\\$ \[$(tput sgr0)\]"

#aliases
alias ls="ls --color=auto"
alias ll="ls -al -h --color=auto"
alias pdf=$READER
alias pdf2=$READER2
alias pi="sudo pacman -S"
alias pu="sudo pacman -Syu"
alias pr="sudo pacman -Rns"
alias pq="pacman -Ss"
alias cu="nmcli con up --ask"
alias vpn="sudo vpnc"

##custom commands
#search and edit a configuration file
ce() { vim $(find $HOME/dotfiles/* -type f | fzf); }
#search and enter a directory (fails if you lack permissions)
fd() { cd "$(find / -type d 2>/dev/null | fzf)" && pwd && ls; }
#search for a process and kill it
kp() { kill -s SIGKILL "$(ps aux | fzf | awk '{ print $2 }')" 2>/dev/null; }
