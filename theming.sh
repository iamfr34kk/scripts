gsettings set org.gnome.desktop.interface color-scheme 'prefer-dark'
gsettings set org.gnome.desktop.background picture-uri-dark "file:///home/$(whoami)/setup/scripts/backgrounds/teal.jpg"
gsettings set org.gnome.desktop.interface gtk-theme "Colloid-Teal-Dark-Compact"
gsettings set org.gnome.desktop.interface icon-theme "Colloid-Teal-Dark"
dconf write /org/gnome/shell/extensions/user-theme/name "'Colloid-Teal-Dark-Compact'"
gsettings set org.gnome.desktop.interface font-name 'Gugi 10'
gsettings set org.gnome.desktop.interface document-font-name 'Fira Code weight=450 10'
gsettings set org.gnome.desktop.interface monospace-font-name 'Fira Code weight=450 10'
