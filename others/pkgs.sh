#Installed packages arch linux
if command -v pacman &>/dev/null || [ -f /etc/arch-release]; then
  # Function to check if a package is installed in Arch Linux
  is_package_installed() {
    local pkg_name=$1
    # pacman -Q queries the local database.
    # We redirect output to /dev/null to prevent it from cluttering the script's output.
    # The command succeeds (exit code 0) if the package is found, fails (exit code 1) otherwise.
    pacman -Q "$pkg_name" &>/dev/null
    # Return the exit status of the pacman command
    return $?
  }

  # Example usage:
  PACKAGES_ARCH=("fakeroot", "firefox", "neovim", "fzf", "flatpak", "zsh", "steam", "lutris", "mangohud", "gamemode", "vlc", "gnome-tweaks", "figlet", "lolcat", "wget", "curl", "git", "base-devel", "qbittorrent")

  if is_package_installed "$PACKAGES_ARCH"; then
    echo "The package $PACKAGES_ARCH is installed."
  else
    echo "The package $PACKAGES_ARCH is not installed. Installing now..."
    sudo pacman -S --noconfirm "$PACKAGES_ARCH"
#   read -p "Do you want to install kitty terminal : " kitty_ans
#    if [[ "$kitty_ans" =~ [Yy] ]] || [[ -z "$kitty_ans" ]]; then
#     curl -L https://sw.kovidgoyal.net/kitty/installer.sh | sh /dev/stdin
#    fi
  fi
  if command -v yay &>/dev/null; then
    echo "yay is installed"
  else
    ./git_pkg_install.sh https://aur.archlinux.org/yay.git
  fi

fi
