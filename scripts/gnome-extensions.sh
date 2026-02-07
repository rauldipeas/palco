#!/bin/bash
set -e
# Extensões do GNOME
sudo apt install -y \
	gnome-shell-extension-appindicator \
	gnome-shell-extension-blur-my-shell \
	gnome-shell-extension-caffeine \
	gnome-shell-extension-dash-to-panel \
	gnome-shell-extension-manager \
	gnome-shell-extension-user-theme
sudo apt autoremove --purge -y gnome-shell-extension-prefs