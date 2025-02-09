
#!/bin/bash

# Check the current state of animations
ANIMATIONS_STATE=$(hyprctl get animations | grep "Animations:" | awk '{print $2}')
BLUR_STATE=$(hyprctl get decorations | grep "Blur:" | awk '{print $2}')

if [ "$ANIMATIONS_STATE" == "enabled" ]; then
    # Disable animations
    hyprctl keyword animation:enabled false

    # Disable blur and set opacity to full
    hyprctl keyword decoration:blur 0
    hyprctl keyword decoration:active_opacity 1.0
    hyprctl keyword decoration:inactive_opacity 1.0

    # Notify the user
    notify-send "Hyprland" "All animations and effects disabled."
else
    # Re-enable animations
    hyprctl keyword animation:enabled true

    # Restore blur and opacity (you can customize these values)
    hyprctl keyword decoration:blur 1
    hyprctl keyword decoration:active_opacity 0.9
    hyprctl keyword decoration:inactive_opacity 0.8

    # Notify the user
    notify-send "Hyprland" "Animations and effects enabled."
fi
