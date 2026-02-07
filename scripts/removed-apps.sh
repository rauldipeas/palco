#!/bin/bash
set -e
# Aplicativos removidos
sudo apt autoremove --purge -y \
	"*m17n*" \
	anthy-common \
	debian-reference-common \
	evolution \
	fcitx5 \
	firefox-esr \
	fortune-mod \
	gnome-contacts \
	gnome-clocks \
	gnome-maps \
	gnome-music \
	gnome-snapshot \
	gnome-sound-recorder \
	gnome-terminal \
	gnome-tour \
	gnome-weather \
	goldendict-ng \
	hdate-applet \
	ibus-hangul \
	ibus-m17n \
	ibus-mozc \
	im-config \
	mozc-data \
	shotwell \
	simple-scan \
	thunderbird \
	totem \
	xiterm+thai \
	yelp
sudo rm -fr \
	/usr/lib/python3/dist-packages/distro \
	/usr/lib/python3/dist-packages/gnomemusic \
	/usr/share/ibus-hangul