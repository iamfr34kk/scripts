#!/bin/bash
if [[ -f /home/$(whoami)/.joplin/Joplin.AppImage ]]; then
  echo "Joplin file found"
else
  wget -O - https://raw.githubusercontent.com/laurent22/joplin/dev/Joplin_install_and_update.sh | bash
fi

if [[ -d /home/$(whoami)/.local/kitty.app ]]; then
  echo "kitty directory found"
else
  curl -L https://sw.kovidgoyal.net/kitty/installer.sh | sh /dev/stdin
  sudo ln -sf /home/$(whoami)/.local/kitty.app/bin/* /usr/local/bin
fi
