#!/bin/bash
PACKAGES_ARCH=("firefox" "neovim" "fzf" "flatpak" "zsh" "steam" "lutris" "mangohud" "gamemode" "vlc" "gnome-tweaks" "figlet" "lolcat" "wget" "curl" "git" "base-devel" "qbittorrent")
for pkg in "${PACKAGES_ARCH[@]}"; do
	if pacman -Q "$pkg" &> /dev/null; then
		echo "'$pkg' is Installed"
	else
		sudo pacman -S "$pkg" --noconfirm
	fi
done
exit 0
