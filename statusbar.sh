#! /bin/bash

function wifi() {
    echo $(/usr/bin/nmcli dev wifi | grep -E '^[*]' | awk '/*/ {print $2}')
}

function customDate() {
    echo $(date +"%A, %d %B %Y : %Hh%M")
}

function volume() {
    echo $(amixer sget Master | grep -E -o "[0-9]{1,3}%")
}

function customBar()
{
while true
do
    xsetroot -name "🔊$(volume) | $(wifi) | $(customDate)"
done
}
