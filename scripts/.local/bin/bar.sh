#! /bin/sh
# File              : bar.sh
# Author            : Anton Riedel <anton.riedel@tum.de>
# Date              : 27.04.2020
# Last Modified Date: 22.06.2020
# Last Modified By  : Anton Riedel <anton.riedel@tum.de>

#handle SIGTRAP signals to update the status bar
trap 'update' 5

#set the deliminter character
delim="|"

#set update time in s
time=5

#function that outputs the appearance of the statusbar
status() {

    echo "$delim"

    #get the volume with pulsemixer
    if [ "$(pulsemixer --get-mute)" = "1" ]; then
        echo "🔇"
    else
        pulsemixer --get-volume | awk '{print "🔊" $1}'
    fi
    echo "$delim"

    #show the cpu temperature
    [ "$(cat /etc/hostname)" = "Atlas" ] && sensors | awk '/Tctl/ {print "🔥" $2}'
    [ "$(cat /etc/hostname)" = "hades" ] && sensors | awk '/Package id 0/ {print "🔥" $4}'
    [ "$(cat /etc/hostname)" = "Epimetheus" ] && sensors | awk '/Package id 0/ {print "🔥" $4}'
    echo "$delim"
   
    #show the gpu temperature 
    [ "$(cat /etc/hostname)" = "Atlas" ] && sensors | awk '/edge/ {print "📽️" $2}' && echo "$delim"

    #show RAM usage
    free -h | awk '/^Mem:/ {print "💾" $3 "/" $2}'
    echo "$delim"

    #show remaining battery power
    if [ -d /sys/class/power_supply/BAT? ]; then
        acpi -b | awk '/Battery 0/ {print $3 $4 "("$5")"}' | sed -e 's/,//g; s/Charging/🔌/g; s/Full/⚡/g; s/Discharging/🔋/g; s/Unknown/♻️/g'
    else
        echo "⛽"
    fi
    echo "$delim"

    #wifi quality percentage
    grep "^\s*w" /proc/net/wireless | awk '{ print "📶",int($3 * 100 / 70)"%" }'
    sed "s/down//;s/up/🌐/" /sys/class/net/e*/operstate
    echo "$delim"

    # Date and time.
    echo "📅"
    date '+%Y %b %d (%a) %I:%M%p'
    echo "$delim"
}

update() {
    xsetroot -name "$(status | tr -d '\n')" &
}

while :; do
    update
    sleep $time &
    wait
done

exit 0

