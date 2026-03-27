#!/usr/bin/env bash
conf="/etc/vconsole.conf"

# Extract keyboard settings from vconsole.conf
layout=$(grep '^XKBLAYOUT=' "$conf" | cut -d= -f2 | tr -d '"')
variant=$(grep '^XKBVARIANT=' "$conf" | cut -d= -f2 | tr -d '"')

# Apply keyboard settings using localectl
if [[ -n "$layout" ]]; then
    if [[ -n "$variant" ]]; then
        sudo localectl set-x11-keymap "$layout" "" "$variant"
    else
        sudo localectl set-x11-keymap "$layout"
    fi
fi