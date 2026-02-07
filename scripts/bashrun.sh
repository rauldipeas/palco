#!/bin/bash
set -e
sudo ln -fs /usr/share/icons/Papirus/64x64/apps/display-im6.q16.svg /usr/local/share/icons/Papirus-Dark/128x128/apps/display-im7.q16.svg
wget -q --show-progress https://estudio-debian.pages.dev/static/bashrun.deb
sudo apt install -y "$PWD"/bashrun.deb
rm "$PWD"/bashrun.deb