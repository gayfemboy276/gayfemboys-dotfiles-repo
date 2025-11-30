#!/bin/bash

# hey! this script will set up your dotfiles for hyprland, wofi, cava, and bashrc.
# make sure you run it in the folder where all your configs are (no subfolders).

DOTFILES_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
echo "running installer from: $DOTFILES_DIR"

# make sure we're running with sudo for pacman
if [ "$EUID" -ne 0 ]; then
    echo "yo, gotta run this with sudo for pacman to work"
    echo "try: sudo ./install.sh"
    exit 1
fi

set -e  # stop if anything goes wrong

# install the needed packages
echo "installing packages: hyprland, hyprpaper, wofi, cava..."
pacman -S --needed --noconfirm hyprland hyprpaper wofi cava

# create config folders if they don’t exist
echo "creating config folders..."
mkdir -p ~/.config/hyprland
mkdir -p ~/.config/wofi
mkdir -p ~/.config/cava
mkdir -p ~/.config/kitty   # just in case for permissions

# copy configs from this folder to the proper places
echo "copying dotfiles..."

# hyprland
if [ -f "$DOTFILES_DIR/hyprland.conf" ]; then
    cp -f "$DOTFILES_DIR/hyprland.conf" ~/.config/hyprland/
    echo "hyprland.conf copied"
fi

# wofi
if [ -f "$DOTFILES_DIR/wofi.conf" ]; then
    cp -f "$DOTFILES_DIR/wofi.conf" ~/.config/wofi/
    echo "wofi.conf copied"
fi

# cava
if [ -f "$DOTFILES_DIR/cava" ]; then
    cp -f "$DOTFILES_DIR/cava" ~/.config/cava/
    echo "cava config copied"
fi

# bashrc
if [ -f "$DOTFILES_DIR/.bashrc" ]; then
    cp -f "$DOTFILES_DIR/.bashrc" ~/.bashrc
    echo ".bashrc copied"
fi

# done
echo ""
echo "setup complete! all your configs are in place"
echo "don't forget to set an image for hyprpaper in $HOME/.config/hypr/hyprpaper.conf"
echo "so your wallpaper actually shows up"
