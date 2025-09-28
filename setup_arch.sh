#!/bin/bash

# Automated Arch Linux Setup Script
# This script installs all necessary packages and sets up dotfiles

set -e  # Exit on any error

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Function to print colored output
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

# Function to check if command exists
command_exists() {
    command -v "$1" >/dev/null 2>&1
}

# Function to install AUR helper (yay)
install_yay() {
    if ! command_exists yay; then
        print_status "Installing yay AUR helper..."
        cd /tmp
        git clone https://aur.archlinux.org/yay.git
        cd yay
        makepkg -si --noconfirm
        cd ~
        print_success "yay installed successfully"
    else
        print_success "yay is already installed"
    fi
}

# Function to install packages
install_packages() {
    print_status "Updating system packages..."
    sudo pacman -Syu --noconfirm

    print_status "Installing official repository packages..."
    
    # Core system packages
    local official_packages=(
        # Hyprland and Wayland
        "hyprland"
        "hyprpaper"
        "hypridle"
        "hyprlock"
        "xdg-desktop-portal-hyprland"
        "xdg-desktop-portal-gtk"
        "qt5-wayland"
        "qt6-wayland"
        
        # Audio
        "pipewire"
        "pipewire-pulse"
        "pipewire-alsa"
        "wireplumber"
        "pavucontrol"
        
        # Terminal and shell
        "kitty"
        "fish"
        
        # File manager and utilities
        "dolphin"
        "thunar"
        "ranger"
        
        # Text editors
        "neovim"
        "neovide"
        
        # Browsers
        "firefox"
        
        # Media
        "mpv"
        "imv"
        "grim"
        "slurp"
        "wl-clipboard"
        
        # System utilities
        "fastfetch"
        "btop"
        "htop"
        "tree"
        "zip"
        "unzip"
        "wget"
        "curl"
        "git"
        "openssh"
        "bat"
        "fzf"
        "ripgrep"
        "fd"
        "exa"
        
        # Network
        "networkmanager"
        "network-manager-applet"
        "bluez"
        "bluez-utils"
        "blueman"
        
        # Development
        "base-devel"
        "python"
        "python-pip"
        "nodejs"
        "npm"
        "jdk11-openjdk"
        
        # Fonts
        "ttf-jetbrains-mono-nerd"
        "ttf-nerd-fonts-symbols"
        "noto-fonts"
        "noto-fonts-emoji"
        
        # Theme and appearance
        "kvantum"
        "qt5ct"
        "qt6ct"
        "gtk3"
        "gtk4"
        
        # System tools
        "polkit-kde-agent"
        "xarchiver"
        "file-roller"
    )

    sudo pacman -S --needed --noconfirm "${official_packages[@]}"
    print_success "Official packages installed"

    print_status "Installing AUR packages..."
    
    # AUR packages
    local aur_packages=(
        "waybar-hyprland"
        "rofi-wayland"
        "rose-pine-hyprcursor"
        "wlogout"
        "swww"
        "nwg-look"
        "speedtest-cli"
        "visual-studio-code-bin"
    )

    for package in "${aur_packages[@]}"; do
        if ! yay -Qi "$package" >/dev/null 2>&1; then
            print_status "Installing $package..."
            yay -S --noconfirm "$package"
        else
            print_success "$package is already installed"
        fi
    done
    
    print_success "AUR packages installed"
}

# Function to setup dotfiles
setup_dotfiles() {
    print_status "Setting up dotfiles..."
    
    # Ensure we're in the dotfiles directory
    DOTFILES_DIR="$HOME/dotfiles"
    if [ ! -d "$DOTFILES_DIR" ]; then
        print_error "Dotfiles directory not found at $DOTFILES_DIR"
        print_status "Cloning dotfiles repository..."
        git clone https://github.com/prasenbhandari/dotfiles.git "$DOTFILES_DIR"
        cd "$DOTFILES_DIR"
    else
        cd "$DOTFILES_DIR"
        git pull origin main
    fi
    
    # Make install script executable and run it
    chmod +x install_dotfiles.sh
    ./install_dotfiles.sh
    
    print_success "Dotfiles configured"
}

# Function to setup services
setup_services() {
    print_status "Enabling system services..."
    
    # Enable NetworkManager
    sudo systemctl enable NetworkManager
    sudo systemctl start NetworkManager
    
    # Enable Bluetooth
    sudo systemctl enable bluetooth
    sudo systemctl start bluetooth
    
    # Enable audio services
    systemctl --user enable pipewire
    systemctl --user enable pipewire-pulse
    systemctl --user enable wireplumber
    
    print_success "System services configured"
}

# Function to setup fish shell
setup_fish() {
    print_status "Setting up Fish shell..."
    
    # Install fisher (plugin manager)
    if ! command_exists fisher; then
        curl -sL https://raw.githubusercontent.com/jorgebucaran/fisher/main/functions/fisher.fish | source
    fi
    
    # Change default shell to fish
    if [ "$SHELL" != "/usr/bin/fish" ]; then
        print_status "Changing default shell to fish..."
        chsh -s /usr/bin/fish
        print_success "Default shell changed to fish"
    fi
    
    print_success "Fish shell configured"
}

# Function to setup development environment
setup_development() {
    print_status "Setting up development environment..."
    
    # Install pipx for Python packages
    if ! command_exists pipx; then
        python -m pip install --user pipx
        python -m pipx ensurepath
    fi
    
    # Install global npm packages
    if command_exists npm; then
        npm install -g neovim
    fi
    
    # Setup Hadoop (based on your fish config)
    if [ ! -d "$HOME/hadoop" ]; then
        print_status "Setting up Hadoop..."
        cd "$HOME"
        wget https://archive.apache.org/dist/hadoop/common/hadoop-3.3.4/hadoop-3.3.4.tar.gz
        tar -xzf hadoop-3.3.4.tar.gz
        mv hadoop-3.3.4 hadoop
        rm hadoop-3.3.4.tar.gz
        print_success "Hadoop setup complete"
    fi
    
    print_success "Development environment configured"
}

# Function to setup GTK and Qt themes
setup_themes() {
    print_status "Setting up themes and appearance..."
    
    # Create necessary directories
    mkdir -p ~/.config/gtk-3.0
    mkdir -p ~/.config/gtk-4.0
    mkdir -p ~/.config/qt5ct
    mkdir -p ~/.config/qt6ct
    mkdir -p ~/.config/Kvantum
    
    # Set environment variables for Qt
    echo "export QT_QPA_PLATFORMTHEME=qt5ct" >> ~/.bashrc
    echo "export QT_QPA_PLATFORMTHEME=qt5ct" >> ~/.profile
    
    print_success "Theme configuration complete"
}

# Main execution
main() {
    print_status "Starting Arch Linux automated setup..."
    print_warning "This script will install packages and configure your system."
    print_warning "Make sure you have sudo privileges and internet connection."
    
    read -p "Do you want to continue? (y/N): " -n 1 -r
    echo
    if [[ ! $REPLY =~ ^[Yy]$ ]]; then
        print_error "Setup cancelled by user"
        exit 1
    fi
    
    # Update keyring first
    print_status "Updating archlinux-keyring..."
    sudo pacman -Sy --noconfirm archlinux-keyring
    
    # Install yay
    install_yay
    
    # Install packages
    install_packages
    
    # Setup services
    setup_services
    
    # Setup dotfiles
    setup_dotfiles
    
    # Setup fish shell
    setup_fish
    
    # Setup development environment
    setup_development
    
    # Setup themes
    setup_themes
    
    print_success "Setup completed successfully!"
    print_status "Please reboot your system to ensure all changes take effect."
    print_status "After reboot, log into Hyprland session from your display manager."
    
    read -p "Do you want to reboot now? (y/N): " -n 1 -r
    echo
    if [[ $REPLY =~ ^[Yy]$ ]]; then
        sudo reboot
    fi
}

# Run main function
main "$@"
