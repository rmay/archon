#!/bin/sh

yay -S --noconfirm --needed emacs

if [ ! -d "$HOME/.config/emacs" ]; then
    git clone --depth 1 https://github.com/doomemacs/doomemacs ~/.config/emacs
    ~/.config/emacs/bin/doom install --force
fi