#!/bin/bash

confirm_action() {
    printf '%s\n' \
        "Cancel" \
        "Confirm" |
        rofi \
            -dmenu \
            -i \
            -p "$1" \
            -theme-str '
                window {
                    width: 340px;
                    border-radius: 18px;
                }

                mainbox {
                    padding: 14px;
                }

                listview {
                    lines: 2;
                }

                element {
                    padding: 10px;
                }
            '
}

options=$(
    printf '%s\n' \
        "󰒲  Suspend" \
        "󰜉  Restart" \
        "󰐥  Shutdown" \
        "󰍃  Logout"
)

selected=$(printf '%s\n' "$options" | rofi -dmenu -i -p "Power")

case "$selected" in
    "󰒲  Suspend")
        systemctl suspend
        ;;

    "󰜉  Restart")
        confirmation=$(confirm_action "Restart?")
        [ "$confirmation" = "Confirm" ] && systemctl reboot
        ;;

    "󰐥  Shutdown")
        confirmation=$(confirm_action "Shutdown?")
        [ "$confirmation" = "Confirm" ] && systemctl poweroff
        ;;

    "󰍃  Logout")
        confirmation=$(confirm_action "Logout?")
        [ "$confirmation" = "Confirm" ] && hyprctl dispatch exit
        ;;
esac