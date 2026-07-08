#!/usr/bin/env bash

# Exit immediately if a command exits with a non-zero status
set -e

echo "Updating system databases..."
sudo pacman -Sy

echo "Installing Pacman packages..."
grep -v '^#' pkgs-pacman.txt | xargs sudo pacman -S --needed

aur_helpers=(paru yay)
for helper in "${aur_helpers[@]}"; do
    echo $helper
    if command -v $helper >/dev/null 2>&1; then
        aur_helper=$helper
        break
    fi
done

if [[ -v aur_helper ]]; then
    echo "Installing AUR packages using ${aur_helper}..."
    grep -v '^#' pkgs-aur.txt | xargs $aur_helper -S --needed
else
    echo "AUR helper not found. Skipping AUR packages..."
fi

if command -v stow >/dev/null 2>&1; then
    echo "Stowing configuration files..."
    stow_pkgs=(bash delta eza fzf git hypr nvim ssh starship waybar wofi zellij)
    for pkg in "${stow_pkgs[@]}"; do
        echo $pkg
        stow -v $pkg
    done
else
    echo "Stow command not found. Skipping package configuration..."
fi

echo "Setup complete!"

