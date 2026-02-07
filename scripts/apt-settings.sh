#!/bin/bash

# /etc/exrepo/config.yaml
# /etc/apt/sources.list.d/dmo.sources
# /etc/apt/sources.list #temp
# /etc/apt/apt.conf.d/99backports
# /opt/swmc-fixer
# /usr/local/bin/StartupWMClassFixer
# /etc/apt/apt.conf.d/99-startupwmclassfixer

set -e
# apt
sudo sed -i 's/# -/-/g' /etc/extrepo/config.yaml
sudo extrepo update
wget -q --show-progress "$(curl -sSL https://www.deb-multimedia.org/pool/main/d/deb-multimedia-keyring/ | grep -oP 'deb-multimedia-keyring_[0-9.]+_all\.deb' | sort -V | tail -1 | sed 's|^|https://www.deb-multimedia.org/pool/main/d/deb-multimedia-keyring/|')"
sudo apt install -y "$PWD"/deb-multimedia-keyring*.deb
rm "$PWD"/deb-multimedia-keyring*.deb
sudo tee /etc/apt/sources.list.d/dmo.sources >/dev/null <<EOF
Types: deb
URIs: https://www.deb-multimedia.org
Suites: trixie
Components: main non-free
Signed-By: /usr/share/keyrings/deb-multimedia-keyring.pgp
Enabled: yes

Types: deb
URIs: https://www.deb-multimedia.org
Suites: trixie-backports
Components: main
Signed-By: /usr/share/keyrings/deb-multimedia-keyring.pgp
Enabled: yes
EOF
sudo tee /etc/apt/sources.list >/dev/null <<EOF
deb http://deb.debian.org/debian trixie main non-free-firmware
deb http://deb.debian.org/debian trixie-updates main non-free-firmware
deb http://security.debian.org/debian-security/ trixie-security main non-free-firmware
deb http://deb.debian.org/debian trixie-backports main non-free-firmware
EOF
printf 'APT::Default-Release "trixie-backports";' | sudo tee /etc/apt/apt.conf.d/99backports >/dev/null
# Lançadores personalizados
sudo mkdir -p /usr/local/share/custom-launchers
sudo touch /usr/local/share/custom-launchers/placeholder
sudo tee /usr/local/bin/custom-launchers >/dev/null <<'EOF'
for script in /usr/local/share/custom-launchers/*; do
  [ -f "$script" ] && bash "$script"
done
EOF
sudo chmod +x /usr/local/bin/custom-launchers
sudo tee /etc/apt/apt.conf.d/99-custom-launchers >/dev/null <<EOF
DPkg::Post-Invoke {
    "/usr/local/bin/custom-launchers";
};
EOF
sudo mkdir -p /opt/swmc-fixer
#sudo chown $USER /opt/swmc-fixer #needs-fix #post-install
wget -q --show-progress -O /opt/swmc-fixer/StartupWMClassFixer https://codeberg.org/rauldipeas/SWMC-Fixer/raw/main/StartupWMClassFixer
wget -q --show-progress -O /opt/swmc-fixer/rdx-database.csv https://codeberg.org/rauldipeas/SWMC-Fixer/raw/main/rdx-database.csv
chmod +x /opt/swmc-fixer/StartupWMClassFixer
sudo ln -fs /opt/swmc-fixer/StartupWMClassFixer /usr/local/bin/
sudo tee /etc/apt/apt.conf.d/99-startupwmclassfixer >/dev/null <<EOF
DPkg::Post-Invoke {
    "StartupWMClassFixer -u;StartupWMClassFixer -a";
};
EOF
# Remover o kernel da versão estável e atualizar o sistema
sudo apt update
sudo apt autoremove --purge -y linux-*-amd64
sudo apt dist-upgrade -y