#!/bin/bash
set -e
sudo apt install -y helvum pipewire-jack
git clone https://github.com/damentz/smt-manager
sudo install smt-manager/smt-manager.pl /usr/local/bin/smt-manager
sudo rm -fr smt-manager
mkdir -p /etc/{pipewire/pipewire.conf.d,wireplumber/main.lua.d}
export QOPT=128
export ROPT=44100
curl -sSL https://codeberg.org/estudio-debian/website/raw/main/src/settings/audio/pipewire/99-custom.conf | envsubst | sudo tee /etc/pipewire/pipewire.conf.d/99-custom.conf >/dev/null
sudo tee /etc/wireplumber/main.lua.d/90-rt.lua >/dev/null <<EOF
rt = {
  allowed = true,
  priority = 88,
  rtkit = true
}
EOF
sudo mkdir -p /usr/local/{bin,share/applications}
sudo wget -q --show-progress -O /usr/local/bin/pipewire-latency-switcher https://codeberg.org/estudio-debian/website/raw/main/src/settings/audio/pipewire/pipewire-latency-switcher
sudo chmod +x /usr/local/bin/pipewire-latency-switcher
sudo wget -q --show-progress -O /usr/local/share/applications/pipewire-latency-switcher.desktop https://codeberg.org/estudio-debian/website/raw/main/src/settings/audio/pipewire/pipewire-latency-switcher.desktop
sudo sed -i 's/audio-speakers/hifi/' /usr/local/share/applications/pipewire-latency-switcher.desktop
sudo wget -q --show-progress -O /usr/local/bin/toggle-pipewire-jack https://codeberg.org/estudio-debian/website/raw/main/src/settings/audio/pipewire/toggle-pipewire-jack
sudo chmod +x /usr/local/bin/toggle-pipewire-jack
sudo ln -fs "$(find /usr/share/doc/pipewire/examples/ld.so.conf.d/ -type f -name 'pipewire-jack-*-linux-gnu.conf' 2>/dev/null | head -n1)" /etc/ld.so.conf.d/pipewire-jack.conf