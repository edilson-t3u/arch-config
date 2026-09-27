#!/bin/bash

export NO_COLOR=1

cal -m |
    rofi \
        -dmenu \
        -i \
        -p "Calendar" \
        -lines 8 \
        -theme-str '
            window {
                width: 380px;
                border: 1px;
                border-radius: 18px;
            }

            mainbox {
                padding: 16px;
            }

            inputbar {
                padding: 10px;
                margin: 0 0 12px 0;
            }

            prompt {
                margin-right: 10px;
            }

            listview {
                lines: 8;
                columns: 1;
                spacing: 4px;
            }

            element {
                padding: 5px 8px;
            }

            element-text {
                horizontal-align: 0.5;
            }
        '