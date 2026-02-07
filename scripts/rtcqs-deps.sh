#!/bin/bash

# /etc/default/grub.d/threadirqs.cfg
# /etc/sysctl.d/swappiness.conf
# /etc/udev/rules.d/99-cpu-dma-latency.rules
# /etc/adduser.conf
# /etc/security/limits.d/25-audio.conf

set -e
# rtcqs
# shellcheck disable=SC2016
printf 'GRUB_CMDLINE_LINUX_DEFAULT="$GRUB_CMDLINE_LINUX_DEFAULT threadirqs"' | sudo tee /etc/default/grub.d/threadirqs.cfg >/dev/null
sudo apt install -y irqbalance systemd-oomd zram-tools
printf 'vm.swappiness = 10' | sudo tee /etc/sysctl.d/50-swappiness.conf >/dev/null
sudo wget -q --show-progress -O /etc/udev/rules.d/99-cpu-dma-latency.rules https://github.com/Ardour/ardour/raw/refs/heads/master/tools/udev/99-cpu-dma-latency.rules >/dev/null
sudo sed -i 's/#EXTRA_GROUPS="users"/EXTRA_GROUPS="audio video"/' /etc/adduser.conf
sudo sed -i 's/#ADD_EXTRA_GROUPS=0/ADD_EXTRA_GROUPS=1/' /etc/adduser.conf
sudo tee /etc/security/limits.d/25-audio.conf >/dev/null <<EOF
@audio   -  rtprio     95
@audio   -  memlock    unlimited
#@audio   -  nice      -19
EOF