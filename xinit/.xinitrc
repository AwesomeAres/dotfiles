#! /bin/bash
###############################################################################
#     File Name           :     .xinitrc
#     Created By          :     Anton Riedel <anton.riedel@hotmail.com>
#     Creation Date       :     [2019-02-23 19:39]
#     Last Modified       :     [2019-09-29 11:57]
#     Description         :     Start Xorg
###############################################################################

#set keyboard
if [ "$(hostname)" = "Atlas" ];then
	setxkbmap us
else 
	setxkbmap de
	picom &
	flameshot &
fi 

#make capslock useful
setxkbmap -option caps:escape

#prevent screen from blanking
xset -dpms
xset s off

#Set default desktop layout
#$HOME/.screenlayout/Standard.sh

#Set default wallpaper
nitrogen --restore

#start background applications
#dunst &
#unclutter --jitter 20 --ignore-scrolling &
#conky -c $HOME/.config/conky/conkyrc &

#start Window Manager
exec qtile
