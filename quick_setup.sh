#!/bin/bash

# Quick Dotfiles Setup Script
# Use this after a fresh Arch Linux installation with Hyprland

set -e

# Colors
GREEN='\033[0;32m'
BLUE='\033[0;34m'
YELLOW='\033[1;33m'
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

# Essential packages for the dotfiles to work
essential_packages=(
    "hyprland"
    "waybar"
    "rofi-wayland"
    "kitty"
    "fish"
    "neovim"
    "fastfetch"
    "dolphin"
    "firefox"
    "pipewire"
    "pipewire-pulse"
    "wireplumber"
    "grim"
    "slurp"
    "wl-clipboard"
    "ttf-jetbrains-mono-nerd"
    "bat"
    "polkit-kde-agent"
)

# Check if running as root
if [ "$EUID" -eq 0 ]; then
    print_warning "Please don't run this script as root"
    exit 1
fi

print_status "Installing essential packages for dotfiles..."
sudo pacman -S --needed --noconfirm "${essential_packages[@]}"

# Install yay if not present
if ! command -v yay >/dev/null 2>&1; then
    print_status "Installing yay..."
    cd /tmp
    git clone https://aur.archlinux.org/yay.git
    cd yay
    makepkg -si --noconfirm
    cd ~
fi

# Install AUR packages
print_status "Installing AUR packages..."
yay -S --noconfirm rose-pine-hyprcursor neovide

# Setup dotfiles
print_status "Setting up dotfiles..."
if [ ! -d "$HOME/dotfiles" ]; then
    git clone https://github.com/prasenbhandari/dotfiles.git "$HOME/dotfiles"
fi

cd "$HOME/dotfiles"
chmod +x install_dotfiles.sh
./install_dotfiles.sh

# Enable services
print_status "Enabling essential services..."
sudo systemctl enable --now NetworkManager
sudo systemctl enable --now bluetooth
systemctl --user enable --now pipewire pipewire-pulse wireplumber

# Setup fish shell
print_status "Setting up Fish shell..."
if [ "$SHELL" != "/usr/bin/fish" ]; then
    chsh -s /usr/bin/fish
    print_success "Default shell changed to fish (will take effect on next login)"
fi

print_success "Quick setup completed!"
print_status "Reboot and select Hyprland session to use your dotfiles"
