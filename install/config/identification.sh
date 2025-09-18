#!/usr/bin/env bash

# Need gum to query for input
yay -S --noconfirm --needed gum

# Configure identification
source ~/.local/share/archon/ansi.sh
echo -e "\nEnter identification for git and autocomplete..."
export ARCHON_USER_NAME=$(gum input --placeholder "Enter full name" --prompt "Name> ")
export ARCHON_USER_EMAIL=$(gum input --placeholder "Enter email address" --prompt "Email> ")
