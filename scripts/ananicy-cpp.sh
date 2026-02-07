#!/bin/bash
set -e
sudo apt install -y cmake libsystemd-dev
git clone https://gitlab.com/ananicy-cpp/ananicy-cpp
cd ananicy-cpp
cmake -B build \
	-DCMAKE_RELEASE_TYPE=Release \
	-DENABLE_SYSTEMD=ON \
	-Wno-dev \
	-S .
cmake --build build --target ananicy-cpp
sudo cmake --install build --component Runtime
cd ..
rm -r ananicy-cpp
sudo git clone https://github.com/CachyOS/ananicy-rules /etc/ananicy.d
sudo rm -f /etc/ananicy.d/{README.md,LICENSE}
sudo systemctl enable ananicy-cpp.service