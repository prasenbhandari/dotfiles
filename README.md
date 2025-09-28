# Dotfiles

My personal Arch Linux dotfiles for a Hyprland-based desktop environment.

## Features

- **Window Manager**: Hyprland (Wayland compositor)
- **Status Bar**: Waybar with custom modules
- **Terminal**: Kitty with transparency
- **Shell**: Fish with custom aliases and functions
- **Application Launcher**: Rofi
- **Text Editor**: Neovim with custom configuration
- **File Manager**: Dolphin, Thunar, Ranger
- **Theme**: Rose Pine color scheme
- **System Info**: Fastfetch with custom config

## Quick Setup

For a fresh Arch Linux installation:

```bash
# Clone the repository
git clone https://github.com/prasenbhandari/dotfiles.git ~/dotfiles
cd ~/dotfiles

# Quick setup (essential packages + dotfiles)
chmod +x quick_setup.sh
./quick_setup.sh
```

## Full Automated Setup

For a complete Arch Linux setup with all packages and configurations:

```bash
# Full setup (all packages + development environment + dotfiles)
chmod +x setup_arch.sh
./setup_arch.sh
```

## Manual Installation

### Prerequisites

Install essential packages:
```bash
sudo pacman -S hyprland waybar rofi-wayland kitty fish neovim fastfetch dolphin firefox pipewire pipewire-pulse wireplumber grim slurp wl-clipboard ttf-jetbrains-mono-nerd
```

### Install Dotfiles

```bash
cd ~/dotfiles
chmod +x install_dotfiles.sh
./install_dotfiles.sh
```

## Package Lists

- `packages.txt` - Official repository packages
- `aur_packages.txt` - AUR packages
- Install packages from lists:
  ```bash
  # Official packages
  sudo pacman -S --needed - < packages.txt
  
  # AUR packages (requires yay)
  yay -S --needed - < aur_packages.txt
  ```

## Configuration Details

### Hyprland
- Custom keybindings and animations
- Multi-monitor support
- NVIDIA-specific optimizations
- Auto-start applications

### Waybar
- Custom modules for system monitoring
- Network, audio, and workspace indicators
- Integrated with Hyprland workspaces

### Fish Shell
- Custom aliases and functions
- Automatic SSH agent setup
- Development environment paths (Java, Hadoop)
- Integration with modern CLI tools (bat, exa, etc.)

### Kitty Terminal
- JetBrains Mono Nerd Font
- Transparency and cursor effects
- Optimized for development workflow

## Key Features

- **Audio**: Full PipeWire setup with PulseAudio compatibility
- **Networking**: NetworkManager with GUI applet
- **Bluetooth**: Bluez with Blueman GUI
- **Development**: Java 11, Node.js, Python with pipx
- **Screenshots**: Grim + Slurp for Wayland screenshots
- **Clipboard**: wl-clipboard for Wayland clipboard management

## Post-Installation

1. Reboot your system
2. Select "Hyprland" from your display manager
3. Log in to enjoy your configured environment

## Customization

- Hyprland config: `~/.config/hypr/`
- Waybar config: `~/.config/waybar/`
- Fish config: `~/.config/fish/`
- Kitty config: `~/.config/kitty/`
- Neovim config: `~/.config/nvim/`

## Troubleshooting

### Common Issues

1. **No audio**: Ensure PipeWire services are running
   ```bash
   systemctl --user enable --now pipewire pipewire-pulse wireplumber
   ```

2. **Missing fonts**: Install nerd fonts
   ```bash
   sudo pacman -S ttf-jetbrains-mono-nerd
   ```

3. **Rofi not launching**: Make sure rofi-wayland is installed
   ```bash
   yay -S rofi-wayland
   ```

## Contributing

Feel free to fork and customize these dotfiles for your own use!

## License

MIT License - feel free to use and modify as needed.
