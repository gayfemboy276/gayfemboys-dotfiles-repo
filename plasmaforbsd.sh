#ok this is unrelated to my dotfiles
#boi chatgpt script goes crazy
#but yeah its for some bullshit for free bsd

#ok stfu

#!/bin/sh
# FreeBSD KDE Plasma Installer Script
# Run as root: sudo sh install_kde.sh

# --- Update packages ---
echo "Updating packages..."
pkg update -f
pkg upgrade -y

# --- Install KDE Plasma 6 (change to plasma5 if needed) ---
echo "Installing KDE Plasma..."
pkg install -y plasma6 plasma6-sddm kde-baseapps

# --- Install GPU drivers (edit depending on your GPU) ---
# Intel/AMD
echo "Installing DRM drivers for Intel/AMD..."
pkg install -y drm-kmod

# NVIDIA (uncomment if you have NVIDIA)
 echo "Installing NVIDIA driver..."
 pkg install -y nvidia-driver

# --- Enable required services ---
echo "Enabling dbus and sddm..."
sysrc dbus_enable="YES"
sysrc sddm_enable="YES"

# --- Start services immediately ---
echo "Starting dbus and sddm..."
service dbus start
service sddm start

echo "KDE Plasma installation complete! Reboot recommended."
