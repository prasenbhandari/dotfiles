
#!/bin/bash

# Get and filter keybindings from hyprctl, then map modmask values to names directly within jq
updated_binds=$(hyprctl binds -j | jq -c '
    .[] | select(.has_description != null) |
    .modmask = (if .modmask == 64 then "Super"
                elif .modmask == 65 then "Super Shift"
                elif .modmask == 8 then "Alt"
                else .modmask end) |
    {modmask: .modmask, key: .key, description: .description, dispatcher: .dispatcher, arg: .arg}' |
    jq -s .)

# Get a list of descriptions for use in rofi
choices=$(echo "$updated_binds" | jq -r '.[] | .description')

# Show choices in rofi
choice=$(echo "$choices" | rofi -dmenu -i -p "Select Bind")

# Check if a choice was made
if [[ -n "$choice" ]]; then
    # Find the selected binding in updated_binds
    selected=$(echo "$updated_binds" | jq -c ".[] | select(.description == \"$choice\")" | head -n 1)

    # Extract values from the selected binding
    modmask=$(echo "$selected" | jq -r '.modmask')
    key=$(echo "$selected" | jq -r '.key')
    dispatcher=$(echo "$selected" | jq -r '.dispatcher')
    arg=$(echo "$selected" | jq -r '.arg')

    # Execute the selected binding's action
    hyprctl dispatch "$dispatcher" "$arg"
    
    # Display a notification with the selected keybinding
    notify-send -a "nixos-logo" "Binding is:" "$modmask + $key"
fi
