#!/bin/bash

TMP_DIR="/tmp"
SAVE_DIR="$HOME/Pictures/Screenshots"
EDITOR="swappy"

mkdir -p "$SAVE_DIR"

FILENAME="screenshot_$(date +'%Y%m%d_%H%M%S_%N').png"
TMP_FILE="$TMP_DIR/$FILENAME"

if ! hyprshot -m region -o "$TMP_DIR" -f "$FILENAME"; then
    exit 1 
fi

if [ ! -s "$TMP_FILE" ]; then
    rm -f "$TMP_FILE"
    exit 0
fi

choice=$(printf "Copy\0icon\x1fedit-copy\nSave\0icon\x1fdocument-save\nEdit\0icon\x1fapplications-graphics\nCancel\0icon\x1fedit-delete" | rofi -dmenu -i -p "Screenshot" -theme-str 'window {width: 400px;} listview {lines: 1;}' -sep '\0' -show-icons)

case "$choice" in
    "Copy")
        wl-copy < "$TMP_FILE"
        notify-send "Screenshot Copied" "The selection was copied to the clipboard."
        ;;
    "Save")
        FILENAME="$SAVE_DIR/$(date +'%Y-%m-%d_%H-%M-%S').png"
        mv "$TMP_FILE" "$FILENAME"
        notify-send "Screenshot Saved" "Saved as $FILENAME"
        ;;
    "Edit")
        "$EDITOR" -f "$TMP_FILE"
        ;;
    "Cancel")
        exit 0
        ;;
esac

rm -f "$TMP_FILE"