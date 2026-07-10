#!/usr/bin/env bash

# Exit immediately if a command exits with a non-zero status
set -e

aur_helpers=(paru yay)
for helper in "${aur_helpers[@]}"; do
    if command -v $helper >/dev/null 2>&1; then
        aur_helper=$helper
        break
    fi
done

if ! [[ -v aur_helper ]]; then
    echo "Failed to locate AUR helper."
    echo "Exiting..."
    exit 1
else
    echo "Found AUR helper: ${aur_helper}"
fi

echo "Updating system databases..."
$aur_helper -Sy

echo "Installing gloabal packages..."
grep -v '^#' pkgs.txt | xargs $aur_helper -S --needed --noconfirm

if ! command -v stow >/dev/null 2>&1; then
    echo "Failed to locate stow"
    echo "Exiting..."
    exit 1
fi

pkgs=(bash eza fzf bibata git starship tldr ghostty zellij dunst pipewire waybar wofi networkmanager-dmenu hypr nvim 1password)
for pkg in "${pkgs[@]}"; do
    if [ -f "${pkg}/pkgs.txt" ]; then
        echo "Installing ${pkg} packages..."
        grep -v '^#' "${pkg}/pkgs.txt" | xargs $aur_helper -S --needed --noconfirm
    fi

    echo "Stowing ${pkg}..."
    stow -v --ignore='^pkgs\.txt$' $pkg
done

echo "Setup complete!"

