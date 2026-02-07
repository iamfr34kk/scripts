#!/bin/bash

# Define the UUIDs of the extensions you want to install
EXT_LIST=(
  "dash-to-dock@micxgx.gmail.com"
  "blur-my-shell@aunetx"
  "user-theme@gnome-shell-extensions.gcampax.github.com"
  "system-monitor@gnome-shell-extensions.gcampax.github.com"
  "drive-menu@gnome-shell-extensions.gcampax.github.com"
  "just-perfection-desktop@just-perfection"
  "clipboard-indicator@tudmotu.com"
)

# Ensure the extensions app is installed (useful for some distros)
# sudo apt install gnome-shell-extension-manager -y

# Loop through each extension UUID
for UUID in "${EXT_LIST[@]}"; do
  echo "Processing extension: $UUID"

  # 1. Get the latest compatible version tag from the GNOME extensions website API
  # This might require some adjustments based on the exact API changes over time
  VERSION_TAG=$(curl -Lfs "https://extensions.gnome.org/extension-query/?search=${UUID}" | jq '.extensions[] | select(.uuid=="'"${UUID}"'") | .shell_version_map | map(.pk) | max')

  if [ "$VERSION_TAG" = "null" ]; then
    echo "Could not find a compatible version tag for $UUID. Skipping."
    continue
  fi

  # 2. Download the extension ZIP file
  ZIP_FILE="${UUID}.zip"
  echo "Downloading ${ZIP_FILE}..."
  wget -O "${ZIP_FILE}" "https://extensions.gnome.org/download-extension/${UUID}.shell-extension.zip?version_tag=$VERSION_TAG"

  # 3. Install the extension using the gnome-extensions command
  echo "Installing ${UUID}..."
  gnome-extensions install --force "${ZIP_FILE}"

  # 4. Enable the extension
  echo "Enabling ${UUID}..."
  gnome-extensions enable "${UUID}"

  # 5. Clean up the downloaded ZIP file
  rm "${ZIP_FILE}"

  echo "${UUID} installed and enabled successfully."
done

# Optional: Restart GNOME Shell for changes to take full effect (especially under X11)
echo "Installation process complete. You may need to restart GNOME Shell."
echo "You can log out and log back in, or press Alt+F2, type 'r', and press Enter (on X11)."
