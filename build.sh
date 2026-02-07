#!/bin/bash
set -e
# Ferramentas de compilação
bash <(curl -sSL https://github.com/rauldipeas/palco/raw/main/scripts/build-tools.sh)
# Aplicativos removidos
bash <(curl -sSL https://github.com/rauldipeas/palco/raw/main/scripts/removed-apps.sh)
# Idiomas não usados
bash <(curl -sSL https://github.com/rauldipeas/palco/raw/main/scripts/removed-localization.sh)
# apt
bash <(curl -sSL https://github.com/rauldipeas/palco/raw/main/scripts/apt-settings.sh)
# Linux RDX 
bash <(curl -sSL https://github.com/rauldipeas/palco/raw/main/scripts/linux-rdx.sh)
# Temas
bash <(curl -sSL https://github.com/rauldipeas/palco/raw/main/scripts/themes.sh)
# Plymouth
bash <(curl -sSL https://github.com/rauldipeas/palco/raw/main/scripts/plymouth.sh)
# Fontes de programas
bash <(curl -sSL https://github.com/rauldipeas/palco/raw/main/scripts/software-sources.sh)
# Topgrade
bash <(curl -sSL https://github.com/rauldipeas/palco/raw/main/scripts/topgrade.sh)
# Synaptic
bash <(curl -sSL https://github.com/rauldipeas/palco/raw/main/scripts/synaptic.sh)
# falcond
bash <(curl -sSL https://github.com/rauldipeas/palco/raw/main/scripts/falcond.sh)
# ananicy-cpp
bash <(curl -sSL https://github.com/rauldipeas/palco/raw/main/scripts/ananicy-cpp.sh)
# rtcqs
bash <(curl -sSL https://github.com/rauldipeas/palco/raw/main/scripts/rtcqs-deps.sh)
# Millisecond
bash <(curl -sSL https://github.com/rauldipeas/palco/raw/main/scripts/millisecond.sh)
# Cable
bash <(curl -sSL https://github.com/rauldipeas/palco/raw/main/scripts/cable.sh)
# JaqalMixer
bash <(curl -sSL https://github.com/rauldipeas/palco/raw/main/scripts/jaqalmixer.sh)
# PipeWire
bash <(curl -sSL https://github.com/rauldipeas/palco/raw/main/scripts/pipewire.sh)
# Sakura
bash <(curl -sSL https://github.com/rauldipeas/palco/raw/main/scripts/sakura.sh)
# LibreWolf
bash <(curl -sSL https://github.com/rauldipeas/palco/raw/main/scripts/librewolf.sh)
# VLC
bash <(curl -sSL https://github.com/rauldipeas/palco/raw/main/scripts/vlc.sh)
# Extensões do GNOME
bash <(curl -sSL https://github.com/rauldipeas/palco/raw/main/scripts/gnome-extensions.sh)
# bashrun
bash <(curl -sSL https://github.com/rauldipeas/palco/raw/main/scripts/bashrun.sh)
# Sobreposições de configurações
bash <(curl -sSL https://github.com/rauldipeas/palco/raw/main/scripts/overrides.sh)
# Configurações do modo "live"
bash <(curl -sSL https://github.com/rauldipeas/palco/raw/main/scripts/live-settings.sh)
# Limpeza de histórico da compilação
bash <(curl -sSL https://github.com/rauldipeas/palco/raw/main/scripts/cleanup.sh)