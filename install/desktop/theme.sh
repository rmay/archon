#!/usr/bin/env bash

# Setup theme links
mkdir -p ~/.config/archon/themes
for f in ~/.local/share/archon/themes/*; do ln -nfs "$f" ~/.config/archon/themes/; done

# Set initial theme basics
mkdir -p ~/.config/archon/current
ln -snf ~/.config/archon/themes/tokyo-night ~/.config/archon/current/theme
ln -snf ~/.config/archon/current/theme/backgrounds/1-scenery-pink-lakeside-sunset-lake-landscape-scenic-panorama-7680x3215-144.png ~/.config/archon/current/background

# Set specific app links for current theme
ln -snf ~/.config/archon/current/theme/neovim.lua ~/.config/nvim/lua/plugins/theme.lua

mkdir -p ~/.config/btop/themes
ln -snf ~/.config/archon/current/theme/btop.theme ~/.config/btop/themes/current.theme