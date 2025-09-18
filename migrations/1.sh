#!/usr/bin/env bash

set -e

if [ ! -f "$HOME/.local/share/archon/bin/archon-xrdp-install" ]; then
  cat > "$HOME/.local/share/archon/bin/archon-xrdp-install" << 'EOF'
#!/usr/bin/env bash
set -e

if ! pacman -Qq xrdp &>/dev/null; then
  # Install xrdp and xorgxrdp
  echo "Installing xrdp and xorgxrdp..."
  yay -S --noconfirm xrdp xorgxrdp

  # Enable and start xrdp services
  echo "Enabling xrdp services..."
  sudo systemctl enable xrdp xrdp-sesman
  sudo systemctl start xrdp xrdp-sesman

  # Set up .xinitrc for Window Maker
  echo "Configuring ~/.xinitrc for Window Maker..."
  echo "exec wmaker" >~/.xinitrc
  chmod +x ~/.xinitrc

  # Confirm firewall rule (optional)
  if command -v ufw &>/dev/null; then
    echo "Allowing xrdp through UFW..."
    sudo ufw allow 3389/tcp
  fi

  echo "xrdp setup complete. You can now connect via RDP to port 3389."
fi
EOF
fi

chmod +x "$HOME/.local/share/archon/bin/archon-xrdp-install"

MENU_SCRIPT_PATH="$HOME/.local/share/archon/bin/archon" 

if ! grep -q '"Enable XRDP"' "$MENU_SCRIPT_PATH"; then
   # Insert "Enable XRDP" into the setup_menu list
   sed -i '/local menu=(/ s/("Docker DBs"/("Docker DBs" "Enable XRDP"/' "$MENU_SCRIPT_PATH"
fi

if ! grep -q '"archon-xrdp-instal"' "$MENU_SCRIPT_PATH"; then
   # Insert corresponding command entry
   sed -i '/"setup_docker_dbs"/a\  "archon-xrdp-install"' "$MENU_SCRIPT_PATH"
fi
