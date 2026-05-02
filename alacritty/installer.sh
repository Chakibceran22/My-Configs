#!/usr/bin/env bash
set -euo pipefail

# Copies alacritty.toml from this script's folder to:
# ~/.config/alacritty/alacritty.toml

SCRIPT_DIR="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)"
SRC="$SCRIPT_DIR/alacritty.toml"
DEST_DIR="$HOME/.config/alacritty"
DEST="$DEST_DIR/alacritty.toml"

if [[ ! -f "$SRC" ]]; then
  echo "Error: alacritty.toml not found next to this script."
  exit 1
fi

mkdir -p "$DEST_DIR"
cp "$SRC" "$DEST"

echo "Installed Alacritty config to: $DEST"