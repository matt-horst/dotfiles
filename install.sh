#!/usr/bin/env bash

# Exit immediately if a command exits with a non-zero status
set -e

echo "Updating system databases..."
sudo pacman -Sy

echo "Installing Pacman packages..."
grep -v '^#' pkgs-pacman.txt | xargs sudo pacman -S --needed --noconfirm

if command -v stow >/dev/null 2>&1; then
    echo "Stowing configuration files..."
    stow .
fi

echo "Setup complete!"

