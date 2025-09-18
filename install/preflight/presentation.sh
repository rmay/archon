#!/usr/bin/env bash

if ! pacman -Qq python-terminaltexteffects &>/dev/null; then
  yay -S --noconfirm --needed python-terminaltexteffects
fi