#!/bin/bash

# Install required dependencies (qt5-tools and xdg-utils)
sudo pacman -S --noconfirm qt5-tools xdg-utils

# Create the code-url-handler.desktop file
cat > ~/.local/share/applications/code-url-handler.desktop << EOF
[Desktop Entry]
Name=Visual Studio Code - URL Handler
Comment=Code Editing. Redefined.
GenericName=Text Editor
Exec=/opt/vscode/code --open-url %U
Icon=com.visualstudio.code
Type=Application
NoDisplay=true
StartupNotify=true
Categories=Utility;TextEditor;Development;IDE;
MimeType=x-scheme-handler/vscode;
Keywords=vscode;
EOF

# Set correct permissions for the .desktop file
chmod 644 ~/.local/share/applications/code-url-handler.desktop

# Install the .desktop file
desktop-file-install --dir=$HOME/.local/share/applications ~/.local/share/applications/code-url-handler.desktop

# Update the desktop database
update-desktop-database ~/.local/share/applications

# Set the default handler for vscode:// URIs
xdg-mime default code-url-handler.desktop x-scheme-handler/vscode

sudo pacman -S qt5-tools

# Verify the MIME association
echo "Checking MIME association for vscode://"
xdg-mime query default x-scheme-handler/vscode

# Test the vscode:// URI
echo "Testing vscode:// URI handling"
xdg-open vscode://test

# Notify user to try GitHub Copilot login
echo "Setup complete. Open VS Code with '/opt/vscode/code' and try signing into GitHub Copilot."
