#!/usr/bin/env bash

yay -S --noconfirm --needed \
  wget curl unzip inetutils impala \
  fd eza fzf ripgrep zoxide bat jq \
  xclip fastfetch btop ranger \
  nano cronie \
  man tldr less whois plocate bash-completion the_silver_searcher \
  xterm ghostty alacritty tmux openssh \
  base-devel git libx11 libxft libxext \
  xorg-server-devel \
  fastfetch


echo "[+] Configuring sshd..."
# Harden basic settings
sudo sed -i 's/^#Port 22/Port 22/' /etc/ssh/sshd_config
sudo sed -i 's/^#PermitRootLogin .*/PermitRootLogin no/' /etc/ssh/sshd_config
sudo sed -i 's/^#PasswordAuthentication yes/PasswordAuthentication yes/' /etc/ssh/sshd_config

sudo systemctl enable sshd
sudo systemctl start sshd

sudo systemctl enable --now cronie.service

INSTALL_DIR=~/.cache/suckless

if [ ! -d "$INSTALL_DIR" ]; then
  mkdir -p "$INSTALL_DIR"
fi

cd "$INSTALL_DIR"

# st
if [ ! -d "st" ]; then
  echo "Cloning st..."
  git clone https://git.suckless.org/st
fi
cd st

PATCH_FILE="st-xresources-20200604-9ba7ecf.diff"
if [ ! -f "$PATCH_FILE" ]; then
  PATCH_URL="https://st.suckless.org/patches/xresources/${PATCH_FILE}"
  echo "Downloading $PATCH_FILE patch..."
  curl -L "$PATCH_URL" -o "$PATCH_FILE"

  # Apply patch only if not already patched
  if ! grep -q 'xrdb' config.def.h; then
    echo "Applying patch..."
    patch -Np1 < "$PATCH_FILE"
  else
    echo "Patch already applied."
  fi
fi
# Build and install
echo "Building st with xresources patch..."
make clean
make
sudo make install


cat > "$HOME/.terminalrc" << 'EOF'
TERMINAL=ghostty
EOF
