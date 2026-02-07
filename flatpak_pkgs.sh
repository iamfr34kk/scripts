check_installed_pkgs() {
  PACKAGES_FLATPAK=("com.heroicgameslauncher.hgl" "com.vysp3r.ProtonPlus" "org.telegram.desktop" "com.discordapp.Discord" "com.mattjakeman.ExtensionManager")
  for pkg in "${PACKAGES_FLATPAK[@]}"; do
    if flatpak info "$pkg" &>/dev/null; then
      echo "'$pkg' is Installed"
    else
      flatpak install flathub "$pkg"
    fi
  done
}

check_installed_pkgs
