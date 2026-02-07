#Neovim for arch linux

check_installed_pkgs() {
PACKAGES_ARCH=("$1")
for pkg in "${PACKAGES_ARCH[@]}"; do
        if pacman -Q "$pkg" &> /dev/null; then
                echo "'$pkg' is Installed"
        else
                sudo pacman -S "$pkg" --noconfirm
        fi
done
}

NEOVIM_ARCH_PACKAGE="neovim"
if check_installed_pkgs "$NEOVIM_ARCH_PACKAGE"; then
  mkdir ~/.config/nvim
  git clone https://github.com/LazyVim/starter ~/.config/nvim
  rm -rf ~/.config/nvim/.git
fi

