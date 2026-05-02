#!/bin/bash

# Get the directory where this script lives (vscode-backup/)
SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"

echo "Restoring VS Code settings..."

# Copy settings.json
cp "$SCRIPT_DIR/User/settings.json" ~/.config/Code/User/settings.json
echo "✅ settings.json restored"

# Restore extensions if list exists
if [ -f "$SCRIPT_DIR/extensions.txt" ]; then
    echo "Installing extensions..."
    cat "$SCRIPT_DIR/extensions.txt" | xargs -L 1 code --install-extension
    echo "✅ Extensions installed"
fi

echo ""
echo "Done! Restart VS Code to apply everything."