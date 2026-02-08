gsettings set org.gnome.desktop.interface color-scheme 'prefer-dark'
gsettings set org.gnome.desktop.background picture-uri-dark "file:///home/$(whoami)/setup/scripts/backgrounds/teal.jpg"
gsettings set org.gnome.desktop.interface gtk-theme "Colloid-Teal-Dark-Compact"
gsettings set org.gnome.desktop.interface icon-theme "Colloid-Teal-Dark"
dconf write /org/gnome/shell/extensions/user-theme/name "'Colloid-Teal-Dark-Compact'"
gsettings set org.gnome.desktop.interface font-name 'Gugi 10'
gsettings set org.gnome.desktop.interface document-font-name 'FiraCode Nerd Font weight=450 10'
gsettings set org.gnome.desktop.interface monospace-font-name 'FiraCode Nerd Font weight=450 10'

cp /home/$(whoami)/.themes/Colloid-Teal-Dark-Compact/gtk-4.0/* /home/$(whoami)/.config/gtk-4.0/
