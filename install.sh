#!/usr/bin/env bash

# Exit immediately if a command exits with a non-zero status
set -e

ARCHON_INSTALL=~/.local/share/archon/install

# Give people a chance to retry running the installation
catch_errors() {
  echo -e "\n\e[31mArchon installation failed!\e[0m"
  echo "You can retry by running: bash ~/.local/share/archon/install.sh"
  echo "Get help from the community, if we had one."
}

trap catch_errors ERR

show_logo() {
  clear
  tte -i ~/.local/share/archon/logo.txt --frame-rate ${2:-120} ${1:-expand}
  echo
}

show_subtext() {
  echo "$1" | tte --frame-rate ${3:-640} ${2:-wipe}
  echo
}

# Install prerequisites
source $ARCHON_INSTALL/preflight/aur.sh
source $ARCHON_INSTALL/preflight/presentation.sh

# Configuration
show_logo beams 240
show_subtext "Let's install archon! [1/6]"
source $ARCHON_INSTALL/config/identification.sh
source $ARCHON_INSTALL/config/config.sh
source $ARCHON_INSTALL/config/detect-keyboard-layout.sh
source $ARCHON_INSTALL/config/fix-fkeys.sh
source $ARCHON_INSTALL/config/network.sh
source $ARCHON_INSTALL/config/power.sh

# Development
show_logo decrypt 920
show_subtext "Installing terminal tools [2/6]"
source $ARCHON_INSTALL/development/terminal.sh
source $ARCHON_INSTALL/development/development.sh
source $ARCHON_INSTALL/development/nvim.sh
source $ARCHON_INSTALL/development/doom-emacs.sh
source $ARCHON_INSTALL/development/ruby.sh
source $ARCHON_INSTALL/development/golang.sh
source $ARCHON_INSTALL/development/docker.sh
source $ARCHON_INSTALL/development/firewall.sh

# Desktop
show_logo slice 60
show_subtext "Installing desktop tools [3/6]"
source $ARCHON_INSTALL/desktop/x11.sh
source $ARCHON_INSTALL/desktop/windowmaker.sh
source $ARCHON_INSTALL/desktop/desktop.sh
source $ARCHON_INSTALL/desktop/bluetooth.sh
source $ARCHON_INSTALL/desktop/fonts.sh
source $ARCHON_INSTALL/desktop/printer.sh
source $ARCHON_INSTALL/desktop/theme.sh

# Apps
show_logo expand
show_subtext "Installing default applications [4/6]"
source $ARCHON_INSTALL/apps/apps.sh
source $ARCHON_INSTALL/apps/mimetypes.sh

# Window Maker settings
show_logo decrypt 920
show_subtext "Window Maker settings [5/6]"
source $ARCHON_INSTALL/desktop/windowmaker_settings.sh

# Updates
show_logo highlight
show_subtext "Updating system packages [6/6]"
sudo updatedb
sudo pacman -Syu --noconfirm

# Reboot
show_logo laseretch 920
show_subtext "You're done! Rebooting now..."
sleep 2
reboot