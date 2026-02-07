#!/bin/bash
set -e
# Limpeza de histórico da compilação
sudo apt clean
sudo apt autoclean
sudo apt autoremove --purge -y
rm -fr \
	/root/.cache \
	/root/.local \
	/root/.ssh \
	/root/.wget-hsts