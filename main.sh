#!/bin/bash

# System Update && Upgrade && debloating default arch
if ping -c 1 8.8.8.8 >/dev/null 2>&1; then
  sleep 0.5
  ./os_check_and_update.sh
else
  echo "Not connected to internet : ... "
fi

sleep 1s

./font_match.sh

sleep 1s

./nvim.sh

sleep 1s

#Theming GNOME && neovim LazyVim setup

./git_pkg_install.sh https://github.com/vinceliuice/Colloid-gtk-theme.git

sleep 0.5

./git_pkg_install.sh https://github.com/vinceliuice/Colloid-icon-theme.git

sleep 0.5

./git_pkg_install.sh https://github.com/iamfr34kk/neovim.git

sleep 0.5

./flatpak_pkgs.sh

sleep 1s

./extra_app.sh

sleep 1s

./extensions.sh

sleep 1s

./theming.sh

sleep 1s

./gpu_driver.sh

echo "Task finished"
