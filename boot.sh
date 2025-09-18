#!/usr/bin/env bash

ansi_art='
▄████████    ▄████████  ▄████████    ▄█    █▄     ▄██████▄  ███▄▄▄▄   
███    ███   ███    ███ ███    ███   ███    ███   ███    ███ ███▀▀▀██▄ 
███    ███   ███    ███ ███    █▀    ███    ███   ███    ███ ███   ███ 
███    ███  ▄███▄▄▄▄██▀ ███         ▄███▄▄▄▄███▄▄ ███    ███ ███   ███ 
▀███████████▀▀███▀▀▀▀▀   ███        ▀▀███▀▀▀▀███▀  ███    ███ ███   ███ 
███    ███ ▀███████████ ███    █▄    ███    ███   ███    ███ ███   ███ 
███    ███   ███    ███ ███    ███   ███    ███   ███    ███ ███   ███ 
███    █▀    ███    ███ ████████▀    ███    █▀     ▀██████▀   ▀█   █▀  
             ███    ███'

echo -e "\n$ansi_art\n"

sudo pacman -Sy --noconfirm --needed git

echo -e "\nCloning Archon..."
rm -rf ~/.local/share/archon/
git clone https://github.com/rmay/archon.git ~/.local/share/archon >/dev/null

# Use custom branch if instructed
if [[ -n "$ARCHON_REF" ]]; then
  echo -e "\eUsing branch: $ARCHON_REF"
  cd ~/.local/share/archon
  git fetch origin "${ARCHON_REF}" && git checkout "${ARCHON_REF}"
  cd -
fi

echo -e "\nInstallation starting..."
source ~/.local/share/archon/install.sh
