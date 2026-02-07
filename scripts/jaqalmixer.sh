#!/bin/bash
set -e
sudo ln -fs /usr/share/icons/Papirus/64x64/devices/soundcard.svg /usr/local/share/icons/Papirus-Dark/128x128/apps/jaqalmixer.svg
sudo apt install -y alsa-utils \
	build-essential \
	cmake \
	libasound2-dev \
	qt6-base-dev
git clone https://codeberg.org/zynskeyfolf/jaqalmixer
cd jaqalmixer
mkdir build
cd build
cmake ..
make
sudo make install
cd ../..
rm -fr jaqalmixer