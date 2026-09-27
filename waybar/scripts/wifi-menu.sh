#!/bin/bash

wifi_status=$(nmcli radio wifi)

if [ "$wifi_status" = "disabled" ]; then
    nmcli radio wifi on
    sleep 1
fi

networks=$(nmcli -t -f SSID,SIGNAL,SECURITY device wifi list | \
    awk -F: 'NF >= 2 && $1 != "" {print $1 "  [" $2 "%]  " $3}' | \
    sort -u)

selected=$(printf '%s\n' "$networks" | rofi -dmenu -i -p "Wi-Fi")

[ -z "$selected" ] && exit 0

ssid=$(printf '%s' "$selected" | sed 's/  \[[0-9]*%\]  .*//')

security=$(printf '%s' "$selected" | sed 's/.*]  //')

if [ "$security" = "--" ]; then
    nmcli device wifi connect "$ssid"
else
    password=$(rofi -dmenu -password -p "Password")

    [ -z "$password" ] && exit 0

    nmcli device wifi connect "$ssid" password "$password"
fi