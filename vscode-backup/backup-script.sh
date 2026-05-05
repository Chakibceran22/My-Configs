#!/bin/bash

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"

echo "Backing up VS Code settings..."

cp ~/.config/Code/User/settings.json "$SCRIPT_DIR/User/settings.json"
echo "✅ settings.json backed up"

if [ -d ~/.config/Code/User/snippets ] && [ "$(ls -A ~/.config/Code/User/snippets)" ]; then
    cp -r ~/.config/Code/User/snippets "$SCRIPT_DIR/User/"
    echo "✅ snippets backed up"
fi

echo "Backing up extensions list..."
code --list-extensions > "$SCRIPT_DIR/extensions.txt"
echo "✅ extensions.txt updated"

echo ""
echo "Done! All VS Code configs backed up to $SCRIPT_DIR"