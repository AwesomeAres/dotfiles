#!/bin/sh

echo "Choose layout
1 -> normal
2 -> vorlesung"

read layout

case $layout in 
	"1") $HOME/.config/screenlayout/normal.sh
	xinput --map-to-output "12" eDP1
	xinput --map-to-output "19" eDP1
	xinput --map-to-output "20" eDP1 ;;

	"2") $HOME/.config/screenlayout/vorlesung.sh
	xinput --map-to-output "12" eDP1
	xinput --map-to-output "19" eDP1
	xinput --map-to-output "20" eDP1 ;;

*) echo "no valid input"
esac 
