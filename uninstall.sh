#!/usr/bin/env bash

# Exit immediately if non-zero exit code
set -e

read_pkgs() {
    # Strips comments from package lists
    cat "${1}" | sed 's/#.*$//'
}

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
$aur_helper -S stow --needed --noconfirm

if ! command -v stow >/dev/null 2>&1; then
    echo "Failed to locate stow"
    echo "Exiting..."
    exit 1
fi

modules=()

if (( $# > 0 )); then
    modules+=("${@}")
else
    modules+=(
        bash
        eza
        fzf
        bibata
        git
        starship
        tldr
        ghostty
        zellij
        dunst
        pipewire
        waybar
        wofi
        networkmanager-dmenu
        hypr
        nvim
        1password
        nvidia-open
        cyberdream
        $HOSTNAME
    )
fi

pkgs=($(read_pkgs "pkgs.txt"))
for mod in "${modules[@]}"; do
    echo "Processing ${mod}..."

    if [ -f "${mod}/pkgs.txt" ]; then
        pkgs+=($(read_pkgs "${mod}/pkgs.txt"))
    fi

    stow -D -v --ignore='^pkgs\.txt$' $mod
done

echo "Uninstalling packages..."
grep -v '^#' "${pkg}/pkgs.txt" | xargs $aur_helper -Rns --noconfirm
