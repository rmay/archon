#!/usr/bin/env bash

# Window Maker Installation Script for Arch Linux
# Requires yay AUR helper to be installed

set -e # Exit on any error

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Function to print colored output
print_status() {
  echo -e "${BLUE}[INFO]${NC} $1"
}

print_success() {
  echo -e "${GREEN}[SUCCESS]${NC} $1"
}

print_warning() {
  echo -e "${YELLOW}[WARNING]${NC} $1"
}

print_error() {
  echo -e "${RED}[ERROR]${NC} $1"
}

print_status "Starting Window Maker installation..."

# Core Window Maker packages
WINDOWMAKER_PACKAGES=(
  "windowmaker"       # Main Window Maker package
  "windowmaker-extra" # Additional themes and tools
)

# Optional but recommended packages
OPTIONAL_PACKAGES=(
  "wmaker-utils"   # Window Maker utilities from AUR
  "wmclock"        # Clock dock app
  "wmcpuload"      # CPU load monitor
  "wmmemmon"       # Memory monitor
  "wmnet"          # Network monitor
  "wmsystemtray"   # Systemtray
  "pipewire-pulse" # Pipewire pulseaudio
  "pasystray"      # Pulseaudio systray item
  "ttf-dejavu"     # Good fonts for Window Maker
  "dmenu"          # Application launcher
  "rofi"           # Application launcher
  "gvim"           # GUI text editor
  "xorg-xman"      # Xman for searching man pages
  "xpdf"           # PDF viewer
  "xorg-xclock"    # Clock
  "xlockmore"      # screen lock
  "wmsetbg"        # Setting the background from the CLI
  "xscreensaver"   # The classic screensaver
)

# Install core Window Maker packages
print_status "Installing core Window Maker packages..."
for package in "${WINDOWMAKER_PACKAGES[@]}"; do
  print_status "Installing $package..."
  if yay -S --noconfirm --needed "$package"; then
    print_success "$package installed successfully"
  else
    print_error "Failed to install $package"
    exit 1
  fi
done

print_status "Installing optional packages..."
for package in "${OPTIONAL_PACKAGES[@]}"; do
  print_status "Installing $package..."
  if yay -S --noconfirm --needed "$package" 2>/dev/null; then
    print_success "$package installed successfully"
  else
    print_warning "Failed to install $package (might not be available)"
  fi
done

# Create Window Maker configuration directory
print_status "Setting up Window Maker configuration..."
if [ ! -d "$HOME/GNUstep" ]; then
  mkdir -p "$HOME/GNUstep"
  print_success "Created GNUstep directory"
fi

# Create .Xresources
cat >"$HOME/.Xresources" <<'EOF'
xcalc*background: #282828
xcalc*foreground: #ffffff
xcalc*button.background: #3a3a3a
xcalc*button.foreground: #ffcc00
xcalc*display.background: #1e1e1e
xcalc*display.foreground: #00ff00
xcalc*font: 10x20

*.font: Monospace-12
*.background: #1e1e2e
*.foreground: #cdd6f4
*.cursorColor: #f5c2e7
*.color0: #1d2021
*.color1: #cc241d
*.color2: #98971a
*.color3: #d79921
*.color4: #458588
*.color5: #b16286
*.color6: #689d6a
*.color7: #a89984
*.color8: #928374
*.color9: #fb4934
*.color10: #b8bb26
*.color11: #fabd2f
*.color12: #83a598
*.color13: #d3869b
*.color14: #8ec07c
*.color15: #ebdbb2
EOF

# Create .xinitrc entry for Window Maker
print_status "Setting up .xinitrc..."
if [ ! -f "$HOME/.xinitrc" ]; then
  cat >"$HOME/.xinitrc" <<'EOF'
#!/bin/sh

xset -dpms
xset s off
xset s noblank

xset +fp /usr/share/fonts/misc
xset fp rehash

# Load .Xresources
[ -f ~/.Xresources ] && xrdb -merge ~/.Xresources

# Start Window Maker
# exec wmaker
EOF
  print_success "Created .xinitrc with Window Maker"
else
  if ! grep -q "wmaker" "$HOME/.xinitrc"; then
    print_warning ".xinitrc exists but doesn't contain Window Maker entry"
    print_status "You may want to add 'exec wmaker' to your .xinitrc"
  fi
fi

wprefs_location="/usr/bin/WPrefs"

if [ ! -f "$wprefs_location" ]; then
  sudo ln -s /usr/lib/GNUstep/Applications/WPrefs.app/WPrefs /usr/bin/WPrefs
fi

echo
print_success "Window Maker installation completed!"
echo
