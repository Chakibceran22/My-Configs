#!/bin/bash

# Brave backup script
# Run this anytime you make changes to Brave

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
BACKUP_DIR="$SCRIPT_DIR"
BRAVE_DIR="$HOME/.config/BraveSoftware/Brave-Browser/Default"

mkdir -p "$BACKUP_DIR"

echo "Backing up Brave..."

# Settings & layout
cp "$BRAVE_DIR/Preferences"         "$BACKUP_DIR/"
cp "$BRAVE_DIR/Secure Preferences"  "$BACKUP_DIR/"
echo "✅ Settings backed up"

# Bookmarks
cp "$BRAVE_DIR/Bookmarks"           "$BACKUP_DIR/"
cp "$BRAVE_DIR/Bookmarks.bak"       "$BACKUP_DIR/"
echo "✅ Bookmarks backed up"

# Shortcuts
cp "$BRAVE_DIR/Shortcuts"           "$BACKUP_DIR/"
echo "✅ Shortcuts backed up"

# Extensions
cp -r "$BRAVE_DIR/Extensions"       "$BACKUP_DIR/"
echo "✅ Extensions backed up"

# Save extension IDs + names to a readable list
echo "# Brave Extensions" > "$BACKUP_DIR/extensions-list.txt"
for ext in "$BRAVE_DIR/Extensions"/*/; do
    id=$(basename "$ext")
    name=$(cat "$ext"/*/manifest.json 2>/dev/null | grep '"name"' | head -1 | tr -d ' ",:')
    echo "$id  →  $name" >> "$BACKUP_DIR/extensions-list.txt"
done
echo "✅ Extension list saved"

echo ""
echo "✅ Done! Backed up to: $BACKUP_DIR"
echo "Timestamp: $(date)" >> "$BACKUP_DIR/last-backup.txt"