#!/bin/bash
set -e
curl -sSL https://apt.rauldipeas.com.br/gpg.key | sudo gpg --dearmor --yes -o /etc/apt/trusted.gpg.d/rauldipeas.gpg
cat <<EOF | sudo tee /etc/apt/sources.list.d/rauldipeas.sources>/dev/null
X-Repolib-Name: Raul Dipeas APT repository
Enabled: yes
Types: deb
URIs: https://apt.rauldipeas.com.br
Suites: /
Signed-By: /etc/apt/trusted.gpg.d/rauldipeas.gpg
EOF
sudo apt update
sudo apt install -y linux-rdx