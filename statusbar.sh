#! /bin/bash

function wifi() {
    echo " $(/usr/bin/nmcli dev wifi | grep -E '^[*]' | awk '/*/ {print $3}')"
}

function customDate() {
    echo " $(date +"%A, %d %B %Y : %Hh%M")"
}

function volume() {
    echo " $(amixer sget Master | grep -E -o "[0-9]{1,3}%" -m 1)"
}

function battery() {
    echo " $(</sys/class/power_supply/BAT$1/capacity)"
}

function customBar()
{
while true
do
    xsetroot -name "| $(battery 1) $(battery 0) | $(volume) | $(wifi) | $(customDate)"
done
}
