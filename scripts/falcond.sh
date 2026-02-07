#!/bin/bash
## zig
set -e
wget -q --show-progress "$(curl -sL https://ziglang.org/download | grep -v dev | grep linux | head -n1 | cut -d '"' -f2)"
tar -xf zig-*.tar.xz
rm ./*.tar.xz
sudo cp -r zig* /opt/zig
sudo ln -fs /opt/zig/zig /usr/local/bin/zig
rm -rf zig*
## falcond
git clone https://git.pika-os.com/general-packages/falcond
cd falcond/falcond
zig build -Doptimize=ReleaseFast
mkdir -p falcond/DEBIAN
mkdir -p falcond/usr/bin
mkdir -p falcond/lib/systemd/system
cp zig-out/bin/falcond falcond/usr/bin/
chmod 755 falcond/usr/bin/falcond
cp debian/falcond.service falcond/lib/systemd/system/
VERSION="$(curl -sSL https://git.pika-os.com/general-packages/falcond/releases | grep tag/v | head -1 | cut -d '/' -f6 | cut -d '"' -f1 | sed 's|v||')"
cat >falcond/DEBIAN/control <<EOF
Package: falcond
Version: $VERSION
Section: utils
Priority: optional
Provides: falcond
Rules-Requires-Root: no
Architecture: amd64
Depends: systemd, power-profiles-daemon | tuned-ppd
Maintainer: ferreo <ferreo@pika-os.com>
Description: Performance daemon from PikaOS. Accelerate your gaming experience with falcond, auto setting scx, vcache and choosing performance profiles
EOF
dpkg-deb --build --root-owner-group falcond ../../
sudo dpkg -i --force-all ../../falcond*.deb
rm -r ../../falcond*
sudo systemctl enable falcond.service
## Profiles
sudo mkdir -p /usr/share/falcond/profiles/user
sudo tee /usr/share/falcond/profiles/user/reaper.conf >/dev/null <<EOF
name = "reaper"
performance_mode = true
start_script = "notify-send -a falcond -i mate-cpu-frequency-applet 'Modo performance ativado'"
stop_script = "notify-send -a falcond -i mate-cpu-frequency-applet 'Modo performance desativado'"
EOF
sudo tee /usr/share/falcond/profiles/user/resolve.conf >/dev/null <<EOF
name = "resolve"
performance_mode = true
start_script = "notify-send -a falcond -i mate-cpu-frequency-applet 'Modo performance ativado'"
stop_script = "notify-send -a falcond -i mate-cpu-frequency-applet 'Modo performance desativado'"
EOF
sudo tee /usr/share/falcond/profiles/user/affinity.conf >/dev/null <<EOF
name = "affinity"
performance_mode = true
start_script = "notify-send -a falcond -i mate-cpu-frequency-applet 'Modo performance ativado'"
stop_script = "notify-send -a falcond -i mate-cpu-frequency-applet 'Modo performance desativado'"
EOF