#!/bin/bash

# Pick a color and copy it to clipboard
color=$(hyprpicker --format hex)
echo -n $color | wl-copy

# Display the picked color with rofi
echo "Picked color: $color" | rofi -dmenu -p "Color Picker"
