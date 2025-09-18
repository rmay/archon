#!/usr/bin/env bash

# X11 Installation Script for Arch Linux using yay
# Installs Xorg server and essential components

set -e  # Exit on any error

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

# Update system
update_system() {
    print_status "Updating system packages..."
    yay -Syu --noconfirm
    print_success "System updated"
}

# Install X11 core components
install_xorg() {
    print_status "Installing Xorg server and essential components..."
    
    # Core X11 packages
    local packages=(
        "xorg-server"          # X.Org X server
        "xorg-xinit"           # X.Org initialisation program
        "xorg-apps"            # X.Org applications
        "xorg-xauth"           # X.Org authorization utilities
        "xorg-xrandr"          # Primitive command line interface to RandR extension
        "xorg-xsetroot"        # Classic X utility to set your root window background
        "xorg-fonts-misc"      # Old school fonts
    )
    
    for package in "${packages[@]}"; do
        print_status "Installing $package..."
        yay -S --noconfirm "$package"
    done
    
    print_success "Core X11 components installed"
}

# Install graphics drivers
install_graphics_drivers() {
    print_status "Installing graphics drivers..."
    
    # Detect graphics card
    gpu_info=$(lspci | grep -E "VGA|3D|Display")
    
    if echo "$gpu_info" | grep -i nvidia > /dev/null; then
        print_status "NVIDIA GPU detected"
        yay -S --noconfirm xf86-video-nouveau  # Open source NVIDIA driver
        print_warning "Installed open-source NVIDIA driver (nouveau)"
        print_warning "For proprietary NVIDIA drivers, install nvidia or nvidia-lts manually"
    elif echo "$gpu_info" | grep -i amd > /dev/null; then
        print_status "AMD GPU detected"
        yay -S --noconfirm xf86-video-amdgpu
        print_success "AMD graphics driver installed"
    elif echo "$gpu_info" | grep -i intel > /dev/null; then
        print_status "Intel GPU detected"
        hardware_info=$(lspci)
        if echo "$hardware_info" | grep -i "Lake-N" > /dev/null; then
            print_warning "Lake-N Intel hardware detected, installing generic VESA driver"
            yay -S --noconfirm xf86-video-vesa
        else
            yay -S --noconfirm xf86-video-intel
        fi
 
        print_success "Intel graphics driver installed"
    else
        print_warning "Could not detect specific GPU, installing generic VESA driver"
        yay -S --noconfirm xf86-video-vesa
    fi
}

# Install input drivers
install_input_drivers() {
    print_status "Installing input drivers..."
    
    local input_packages=(
        "xf86-input-libinput"   # Generic input driver (recommended)
        "xorg-xkill"           # Kill a client by its X resource
        "xorg-xprop"           # Property displayer for X
    )
    
    for package in "${input_packages[@]}"; do
        yay -S --noconfirm "$package"
    done
    
    print_success "Input drivers installed"
}

# Optional: Install display manager
install_display_manager() {  
    yay -S --noconfirm lightdm lightdm-gtk-greeter
    sudo systemctl enable lightdm
    print_success "LightDM installed and enabled"     
}


# Main installation function
main() {
    print_status "Starting X11 installation on Arch Linux..."
    
    # Update system
    update_system
    
    # Install components
    install_xorg
    install_graphics_drivers
    install_input_drivers
    
    # Optional components
    install_display_manager
    
    print_success "X11 installation completed!"
    echo
    print_warning "Note: You may need to configure your graphics drivers further"
    print_warning "Check the Arch Wiki for your specific graphics card"
}

# Run main function
main "$@"