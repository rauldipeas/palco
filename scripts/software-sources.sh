#!/bin/bash
set -e
## AM
sudo bash -c "$(curl -sSL https://github.com/ivan-hc/AM/raw/main/INSTALL)"
#am translate pt_BR
sudo chmod 777 /opt/am
sudo ln -fs /usr/share/icons/Papirus/64x64/apps/app-outlet.svg /usr/local/share/icons/Papirus-Dark/128x128/apps/am-gui.svg
am -i --icons am-gui
sudo chmod 777 /opt/am-gui
## Pacstall
yes | sudo bash -c "$(curl -sSL https://pacstall.dev/q/install)"
## sqv
#sudo mkdir -p /etc/crypto-policies/back-ends
#sudo tee /etc/crypto-policies/back-ends/sequoia.config >/dev/null <<EOF
#[hash_algorithms]
#sha1 = "always"
#[packets]
#signature.v3 = "always"
#EOF
# search-app
sudo mkdir -p /usr/local/local/bin
sudo tee /usr/local/bin/search-app >/dev/null <<'EOF'
#!/bin/bash
YELLOW="\033[1;33m"
GREEN="\033[0;32m"
NC="\033[0m" # Reset
if [ -z "$1" ]; then
  printf "%bUso: %s nome_do_programa%b\n" "$YELLOW" "$0" "$NC"
  exit 1
fi
prog="$1"
printf "🔍 Procurando por: %b%s%b\n" "$GREEN" "$prog" "$NC"
printf "\n📦 %bAPT%b:\n" "$YELLOW" "$NC"
apt-cache pkgnames | grep -i "^$prog" | while read -r pkg; do
  version=$(apt-cache show "$pkg" 2>/dev/null | grep -m1 '^Version:' | awk '{print $2}')
  printf "%b%s%b - versão: %s\n" "$GREEN" "$pkg" "$NC" "$version"
done || printf "%bNenhum resultado.%b\n" "$GREEN" "$NC"
printf "\n📦 %bAM%b:\n" "$YELLOW" "$NC"
am_result=$(am -q "$prog" 2>/dev/null | grep -i "$prog")
[[ -n "$am_result" ]] && printf "%b\n" "$am_result" || printf "%bNenhum resultado.%b\n" "$GREEN" "$NC"
printf "\n📦 %bPacstall%b:\n" "$YELLOW" "$NC"
pac_result=$(pacstall -S "$prog" 2>/dev/null | grep -i "$prog")
[[ -n "$pac_result" ]] && printf "%b\n" "$pac_result" || printf "%bNenhum resultado.%b\n" "$GREEN" "$NC"
EOF
sudo chmod +x /usr/local/bin/search-app