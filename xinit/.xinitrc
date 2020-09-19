#! /bin/bash
#set the differences
if [ "$(hostname)" = "Atlas" ];then
	setxkbmap us
else 
	setxkbmap de
	flameshot &
	xrandr --output eDP1 --brightness 1.1
fi 

#make capslock useful
setxkbmap -option caps:escape

#prevent screen from blanking
xset -dpms
xset s off

#japanes input 
fcitx -d &

#change your life
xset r rate 300 50

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
if [ "$(hostname)" = "Atlas" ];then
	exec qtile
fi
exec dwm
