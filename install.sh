#!/bin/bash

# detect the folder where this installer is at

DOTFILES_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
FOLDER_NAME="$(basename "$DOTFILES_DIR")"

# make sure its runnin wit sudo
if [ "$EUID" -ne 0 ]; then
    echo "yo bro run this wit sudo so pacman works"
    echo "here run ts: sudo ./install.sh"
    exit 1
fi


set -e  # exit on other error

#  install the needed packages
echo "installing all needed packages"
sudo pacman -S hyprland hyprpaper cava wofi


# create config folders if they dont exist
echo "Creating config directories..."
mkdir -p ~/.config/hyprland
mkdir -p ~/.config/wofi
mkdir -p ~/.config/cava

# --- 3. Copy or symlink dotfiles ---
echo "done, copying dotfiles to their corresponding folders"

# hyprland
cp -rf ~$DOTFILES_DIR/hyprland/* ~/.config/hyprland/

# wofi
cp -rf ~$DOTFILES_DIR/wofi/* ~/.config/wofi/

# Cava
cp -rf ~DOTFILES_DIR/cava/* ~/.config/cava/

# Bashrc
cp -f ~/DOTFILES_DIR/.bashrc ~/.bashrc

# optional: set permissions (just in case)
chmod -R 644 ~/.config/hyprland/*
chmod -R 644 ~/.config/wofi/*
chmod -R 644 ~/.config/kitty/*
chmod -R 644 ~/.config/cava/*
chmod 644 ~/.bashrc

echo "setup complete, make sure to set an image for hyprpaper in $HOME/.config/hypr/hyprpaper.conf"
echo "so hyprpaper doesnt be a bitch"
