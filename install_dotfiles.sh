
#!/bin/bash

# Enhanced dotfiles installation script
set -e

# Colors for output
GREEN='\033[0;32m'
BLUE='\033[0;34m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
NC='\033[0m'

print_status() {
    echo -e "${BLUE}[INFO]${NC} $1"
}

print_success() {
    echo -e "${GREEN}[SUCCESS]${NC} $1"
}

print_warning() {
    echo -e "${YELLOW}[WARNING]${NC} $1"
}

print_error() {
    echo -e "${RED}[ERROR]${NC} $1"
}

# Get the directory where this script is located
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

print_status "Installing dotfiles from $SCRIPT_DIR"

# Create .config directory if it doesn't exist
mkdir -p ~/.config

# List of dotfiles to symlink
files=(fastfetch fish hypr kitty nvim rofi sway waybar)

# Backup existing configs
backup_dir="$HOME/.config_backup_$(date +%Y%m%d_%H%M%S)"

for file in "${files[@]}"; do
    if [ -e ~/.config/$file ]; then
        if [ ! -d "$backup_dir" ]; then
            mkdir -p "$backup_dir"
            print_warning "Created backup directory: $backup_dir"
        fi
        print_warning "Backing up existing $file config"
        mv ~/.config/$file "$backup_dir/"
    fi
    
    # Symlink the dotfile from the dotfiles directory to ~/.config
    if [ -d "$SCRIPT_DIR/$file" ]; then
        ln -sf "$SCRIPT_DIR/$file" ~/.config/$file
        print_success "Symlinked $file to ~/.config"
    else
        print_error "Directory $SCRIPT_DIR/$file not found"
    fi
done

# Make scripts executable
if [ -d ~/.config/hypr/scripts ]; then
    chmod +x ~/.config/hypr/scripts/*
    print_success "Made Hyprland scripts executable"
fi

if [ -d ~/.config/rofi/scripts ]; then
    chmod +x ~/.config/rofi/scripts/*
    print_success "Made Rofi scripts executable"
fi

if [ -d ~/.config/waybar/scripts ]; then
    chmod +x ~/.config/waybar/scripts/*
    print_success "Made Waybar scripts executable"
fi

print_success "Dotfiles installation completed!"
print_status "Backup created at: $backup_dir" 2>/dev/null || true
