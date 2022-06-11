#! /bin/bash

#set keyboard

if [ "$(cat /etc/hostname)" = "Atlas" ]; then
	setxkbmap us
#	fcitx -d & #japanese Input
elif [ "$(cat /etc/hostname)" = "Hades" ]; then
	setxkbmap de
	flameshot &
#	fcitx -d & #japanese Input
	xrandr --output eDP1 --brightness 0.8
else 
	setxkbmap de
fi 

#make capslock useful
setxkbmap -option caps:escape

#prevent screen from blanking
xset -dpms
xset s off

#change your life
xset r rate 300 50

#japanes input 
#fcitx -d &

#Set default wallpaper
nitrogen --restore

#start compositor 
xcompmgr &

#shortcuts
sxhkd &

#beautiful bar
bar.sh &

#conky -c $HOME/.config/conky/conkyrc &

#you do not need a mouse
unclutter --timeout 2 --jitter 100 --ignore-scrolling &

#start Window Manager
exec dwm
