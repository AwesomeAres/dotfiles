#!/bin/sh

echo "Choose layout
1 -> normal
2 -> vorlesung"

read layout

case $layout in 
	"1") $HOME/.screenlayout/normal.sh
	xinput --map-to-output "12" eDP-1
	xinput --map-to-output "19" eDP-1
	xinput --map-to-output "20" eDP-1 ;;

	"2") $HOME/.screenlayout/vorlesung.sh
	xinput --map-to-output "12" eDP-1
	xinput --map-to-output "19" eDP-1
	xinput --map-to-output "20" eDP-1 ;;

*) echo "no valid input"
esac 
