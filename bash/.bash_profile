###############################################################################
#     File Name           :     .bash_profile
#     Created By          :     Anton Riedel <anton.riedel@hotmail.com>
#     Creation Date       :     [2019-02-23 19:41]
#     Last Modified       :     [2019-03-12 19:43]
#     Description         :     bash_profile
###############################################################################

#set environment variables
export PATH=$HOME/.local/bin:$PATH
export TERMINAL="/usr/bin/termite"
export EDITOR="/usr/bin/nvim"
export VISUAL=$EDITOR
export MYVIMRC=$HOME/.config/nvim/init.vim
export MYVIMCONFIG=$HOME/.config/nvim/config

#~/.local/bin/vifm is a custom script to launch vifm with image preview
#it will be started instead of /usr/bin/vifm since it appears first in PATH
export FILE="$HOME/.local/bin/vifm"

#main browser
export BROWSER="/usr/bin/firefox"

#reader for pdf files
export READER="/usr/bin/zathura"
export READER2="/usr/bin/evince"

#default options for fzf
export FZF_DEFAULT_OPTS="--reverse --height=40%"

#source bashrc
[ -f "$HOME/.bashrc" ] && source "$HOME/.bashrc"

#start window manager on login
if [ -z "$DISPLAY" ] && [ "$(fgconsole)" -eq 1 ]; then
  exec startx --vt1 &> /dev/null
fi
