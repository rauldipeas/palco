#!/bin/bash
set -e
sudo apt install -y sakura
sudo mkdir -p /usr/local/share/applications
sudo tee /usr/local/share/applications/x-terminal-emulator.desktop >/dev/null <<EOF
[Desktop Entry]
StartupWMClass=x-terminal-emulator
Name=X-Terminal-Emulator
Exec=x-terminal-emulator
Icon=utilities-terminal_su
Type=Application
StartupNotify=true
NoDisplay=true
EOF
sudo update-alternatives --set x-terminal-emulator /usr/bin/sakura