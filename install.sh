#!/usr/bin/env bash

# Exit immediately if a command exits with a non-zero status
set -e

echo "Updating system databases..."
sudo pacman -Sy

echo "Installing Pacman packages..."
grep -v '^#' pkgs-pacman.txt | xargs sudo pacman -S --needed --noconfirm

if command -v paru >/dev/null 2>&1; then
    echo "Installing AUR packages..."
    grep -v '^#' pkgs-aur.txt | xargs paru -S --needed --noconfirm
fi

if command -v stow >/dev/null 2>&1; then
    echo "Stowing configuration files..."
    stow *
fi

echo "Setup complete!"

