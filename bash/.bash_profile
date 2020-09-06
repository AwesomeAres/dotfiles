#set environment variables
export PATH=$HOME/.local/bin:$PATH
export TERMINAL="/usr/bin/termite"
export EDITOR="/usr/bin/vim"
export VISUAL=$EDITOR

#main browser
export BROWSER="/usr/bin/firefox"

#reader for pdf files
export READER="/usr/bin/qpdfview"
export READER2="/usr/bin/zathura"

#default options for fzf
export FZF_DEFAULT_OPTS="--reverse --height=40%"

#source bashrc
[ -f "$HOME/.bashrc" ] && source "$HOME/.bashrc"

#start window manager on login
if [ -z "$DISPLAY" ] && [ "$(fgconsole)" -eq 1 ]; then
  exec startx --vt1 &> /dev/null
fi
