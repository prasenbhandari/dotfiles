
#!/bin/bash

# List of dotfiles to symlink
files=(fastfetch fish hypr kitty nvim rofi sway waybar)

for file in "${files[@]}"; do
    # Remove existing config directory (if any)
    rm -rf ~/.config/$file
    # Symlink the dotfile from the dotfiles directory to ~/.config
    ln -sr ~/dotfiles/$file ~/.config/$file
    echo "Symlinked $file to ~/.config"
done
