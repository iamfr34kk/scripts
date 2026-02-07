#!/bin/bash

# Define a function for the update process
perform_update() {
  if command -v apt &>/dev/null || command -v dpkg &>/dev/null; then
    echo "System is Debian-based. Updating..."
    # Update package lists and upgrade installed packages
    if sudo apt update && sudo apt upgrade -y; then
      echo "Debian-based system update complete."
    else
      echo "Failed to update Debian-based system."
      exit 1
    fi
  elif command -v pacman &>/dev/null || [ -f /etc/arch-release ]; then
    echo "System is Arch-based. Updating..."
    # Sync package databases and upgrade all installed packages
    if sudo pacman -Syu --noconfirm; then
      echo "Arch-based system update complete."
    else
      echo "Failed to update Arch-based system."
      exit 1
    fi
  else
    echo "Could not determine distribution type (neither Debian nor Arch)."
    echo "Update cancelled."
    exit 1
  fi
}
arch_debloat() {
  if command -v pacman &>/dev/null || [ -f /etc/arch-release]; then
    echo "Removing GNOME bloats. Removing..."
    sudo pacman -Rns gnome-maps gnome-contacts gnome-weather epiphany yelp gnome-tour gnome-music gnome-user-docs
  fi
}

check_installed_pkgs() {
  PACKAGES_ARCH=("firefox" "neovim" "fzf" "flatpak" "zsh" "steam" "lutris" "mangohud" "gamemode" "vlc" "gnome-tweaks" "figlet" "lolcat" "wget" "curl" "git" "base-devel" "qbittorrent" "fuse3" "vlc-plugins-all")
  for pkg in "${PACKAGES_ARCH[@]}"; do
    if pacman -Q "$pkg" &>/dev/null; then
      echo "'$pkg' is Installed"
    else
      sudo pacman -S "$pkg" --noconfirm
    fi
  done
}

yay_installation() {
  if command -v yay &>/dev/null; then
    echo "YaY is already installed"
  else
    ./git_pkg_install.sh https://aur.archlinux.org/yay-bin.git
  fi
}

check_yay_pkgs() {
  PACKAGES_YAY=("brave")
  for pkg_yay in "${PACKAGES_YAY[@]}"; do
    if yay -Q "$pkg_yay" &>/dev/null; then
      echo "'$pkg_yay' is Installed"
    else
      yay -S brave-bin --noconfirm
    fi
  done
  exit 0
}

# Run the function
perform_update
sleep 1s
arch_debloat
sleep 1s
check_installed_pkgs
sleep 1s
yay_installation
sleep 1s
check_yay_pkgs
