#ok this is unrelated to my dotfiles
#boi chatgpt script goes crazy
#but yeah its for some bullshit for free bsd
#!/bin/sh
# FreeBSD KDE Plasma 6 Installer Script

echo "Updating packages..."
pkg update -f
pkg upgrade -y

echo "Installing KDE Plasma 6..."
pkg install -y plasma6 plasma6-sddm kde-baseapps

# GPU drivers (uncomment only what you need)
echo "Installing DRM drivers for Intel/AMD..."
pkg install -y drm-kmod

# NVIDIA users, uncomment the next line
# pkg install -y nvidia-driver

echo "Enabling required services..."
sysrc dbus_enable="YES"
sysrc sddm_enable="YES"
sysrc seatd_enable="YES"

echo "Starting services..."
service dbus start
service seatd start
service sddm start

echo "KDE Plasma installation complete! Reboot recommended."
