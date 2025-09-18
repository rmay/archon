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



show_logo() {
  clear
  echo -e "\n$ansi_art\n"
}

show_subtext() {
  echo "$1"
  echo
}

check_kernel_reboot_needed() {
  local running installed unamefmt

  running="$(uname -r)"
  installed="$(pacman -Q linux | awk '{print $2}')"
  unamefmt="${installed/.arch/-arch}"   # normalize to uname -r style

  if [[ "$running" == "$unamefmt" ]]; then
    echo "Kernel up to date ($running)"
  else
   # Reboot
    show_logo laseretch 920
    show_subtext "Kernel updated! After reboot, restart the installation script. Rebooting now..."
    sleep 2
    reboot
  fi
}

# Only add Chaotic-AUR if the architecture is x86_64 so ARM users can build the packages
if [[ "$(uname -m)" == "x86_64" ]] && ! command -v yay &>/dev/null; then
  # Try installing Chaotic-AUR keyring and mirrorlist
  if ! pacman-key --list-keys 3056513887B78AEB >/dev/null 2>&1 &&
    sudo pacman-key --recv-key 3056513887B78AEB &&
    sudo pacman-key --lsign-key 3056513887B78AEB &&
    sudo pacman -U --noconfirm 'https://cdn-mirror.chaotic.cx/chaotic-aur/chaotic-keyring.pkg.tar.zst' &&
    sudo pacman -U --noconfirm 'https://cdn-mirror.chaotic.cx/chaotic-aur/chaotic-mirrorlist.pkg.tar.zst'; then

    # Add Chaotic-AUR repo to pacman config
    if ! grep -q "chaotic-aur" /etc/pacman.conf; then
      echo -e '\n[chaotic-aur]\nInclude = /etc/pacman.d/chaotic-mirrorlist' | sudo tee -a /etc/pacman.conf >/dev/null
    fi

    # Install yay directly from Chaotic-AUR
    sudo pacman -Sy --needed --noconfirm yay
  else
    echo "Failed to install Chaotic-AUR, so won't include it in pacman config!"
  fi
fi

# Manually install yay from AUR if not already available
if ! command -v yay &>/dev/null; then
  # Install build tools
  sudo pacman -Sy --needed --noconfirm base-devel
  cd /tmp
  rm -rf yay-bin
  git clone https://aur.archlinux.org/yay-bin.git
  cd yay-bin
  makepkg -si --noconfirm
  cd -
  rm -rf yay-bin
  cd ~
fi

# Add fun and color to the pacman installer
if ! grep -q "ILoveCandy" /etc/pacman.conf; then
  sudo sed -i '/^\[options\]/a Color\nILoveCandy' /etc/pacman.conf
fi

sudo pacman -Syyu --noconfirm

check_kernel_reboot_needed