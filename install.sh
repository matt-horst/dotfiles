#!/bin/bash

if [ "$#" -ne 1 ]; then
    echo "Usage: $0 <install_dir>"
    exit 1
fi


if [ ! -d "$1" ]; then
    echo "$DEST is not a directory"
    exit 1
fi

SRC="$( cd -- "$(dirname -- "$(readlink -f "$0")")" >/dev/null 2>&1 ; pwd -P )"
DEST="$( cd -- "$(readlink -f "$1")" >/dev/null 2>&1 ; pwd -P )"

install () {
    local src=$1
    local dest=$2

    for item in "$src"/* "$src"/.*; do
        if [ -e "$item" ]; then
            if [[ "$(basename $item)" = "$(basename $0)" || "$(basename $item)" = ".git" ]]; then
                continue
            fi

            if [ -d "$item" ]; then
                src_dir="$src/$(basename $item)"
                dest_dir="$dest/$(basename $item)"
                mkdir -p "$dest_dir"

                echo "Creating directory: $dest_dir"
                install "$src_dir" "$dest_dir"
            elif [ -f "$item" ]; then
                dest_file="$dest/$(basename $item)"
                src_file="$src/$(basename $item)"
                cp "$src_file" "$dest_file"

                echo "Copying file: $src_file -> $dest_file"
            fi
        fi
    done
}

echo "Installing to: $DEST"
install "$SRC" "$DEST"
