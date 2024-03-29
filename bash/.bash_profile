#set environment variables
export PATH=$HOME/.local/bin:$PATH
export TERMINAL="/usr/bin/alacritty"
export EDITOR="/usr/bin/vim"
export VISUAL=$EDITOR

#add Android SDK platform tools to path 
#if [ -d "$HOME/platform-tools" ] ; then
#	PATH="$HOME/platform-tools:$PATH"
#fi

#add ~/bin to Path (don't want it on github)
#if [ -d "$HOME/bin" ] ; then
#	PATH="$HOME/bin:$PATH"
#fi 

#japanes input with fcitx
#export GTK_IM_MODULE=fcitx
#export QT_IM_MODULE=fcitx
#export XMODIFIERS=@im=fcitx

#main browser
#export BROWSER="/usr/bin/qutebrowser"
export BROWSER="/usr/bin/firefox"

#reader for pdf files
export READER="/usr/bin/evince"
export READER2="/usr/bin/zathura"

#default options for fzf
export FZF_DEFAULT_OPTS="--reverse --height=40%"

#source bashrc
[ -f "$HOME/.bashrc" ] && source "$HOME/.bashrc"

#start window manager on login
[ "$(tty)" = "/dev/tty1" ] && exec startx &>/dev/null
