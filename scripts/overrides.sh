#!/bin/bash

# /usr/local/bin/palco
# /etc/apt/apt.conf.d/99palco
# /etc/dconf/db/local.d/01-palco-settings
# /etc/dconf/db/profile/user
# /etc/apt/apt.conf.d/99libreoffice
# /etc/libreoffice/registry/main.xcd

set -e
# Sobreposições de configurações
## Versão Palco
sudo tee /usr/local/bin/palco >/dev/null <<EOF
#!/bin/bash
set -e
sed -i 's|PRETTY_NAME=".*"|PRETTY_NAME="Palco GNU/Linux"|' /etc/os-release
sed -i 's|NAME=".*"|NAME="Palco GNU/Linux"|' /etc/os-release
sed -i 's|HOME_URL=".*"|HOME_URL="https://palco.pages.dev"|' /etc/os-release
sed -i 's|SUPPORT_URL=".*"|SUPPORT_URL="https://palco.pages.dev/suporte"|' /etc/os-release
sed -i 's|BUG_REPORT_URL=".*"|BUG_REPORT_URL="https://palco.pages.dev/feedback"|' /etc/os-release
sed -i 's|Debian|Palco|' /etc/issue /etc/issue.net
EOF
sudo chmod +x /usr/local/bin/palco
sudo tee /etc/apt/apt.conf.d/99palco >/dev/null <<EOF
DPkg::Post-Invoke {
    "palco";
};
EOF
## Configurações do gsettings
sudo mkdir -p /etc/dconf/{db/local.d,profile}
sudo tee /etc/dconf/profile/user >/dev/null <<EOF
user-db:user
system-db:local
EOF
sudo tee /etc/dconf/db/local.d/01-palco-settings >/dev/null <<EOF
[org/gnome/desktop/app-folders]
folder-children=['Estudio', 'System', 'Utilities']

[org/gnome/desktop/app-folders/folders/Estudio]
apps=['com.github.magillos.cable.desktop', 'jaqeldview.desktop', 'org.pipewire.Helvum.desktop', 'display-im7.q16.desktop', 'jaqalmixer.desktop', 'io.github.gaheldev.Millisecond.desktop', 'pipewire-latency-switcher.desktop']
name='Estúdio'
translate=false

[org/gnome/desktop/app-folders/folders/System]
apps=['nm-connection-editor.desktop', 'org.gnome.baobab.desktop', 'org.gnome.DiskUtility.desktop', 'org.gnome.Logs.desktop', 'org.freedesktop.MalcontentControl.desktop', 'org.gnome.tweaks.desktop', 'org.gnome.SystemMonitor.desktop']
name='X-GNOME-Shell-System.directory'
translate=true

[org/gnome/desktop/app-folders/folders/Utilities]
apps=['org.gnome.Connections.desktop', 'org.gnome.Evince.desktop', 'org.gnome.FileRoller.desktop', 'org.gnome.font-viewer.desktop', 'org.gnome.Loupe.desktop', 'org.gnome.seahorse.Application.desktop']
name='X-GNOME-Shell-Utilities.directory'
translate=true

[org/gnome/desktop/background]
picture-uri='file:///usr/share/backgrounds/gnome/amber-l.jxl'
picture-uri-dark='file:///usr/share/backgrounds/gnome/amber-d.jxl'

[org/gnome/desktop/interface]
color-scheme='prefer-dark'
cursor-theme='Bibata-Modern-Ice'
font-name='Inter 12'
gtk-theme='adw-gtk3-dark'
icon-theme='Papirus-Dark'

[org/gnome/desktop/peripherals/touchpad]
click-method='areas'

[org/gnome/desktop/wm/keybindings]
move-to-center=['<Super>c']

[org/gnome/mutter]
auto-maximize=false
center-new-windows=true
check-alive-timeout=20000
experimental-features=['scale-monitor-framebuffer']

[org/gnome/settings-daemon/plugins/media-keys]
custom-keybindings=['/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/', '/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom1/']

[org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0]
name='Terminal Ctrl+Alt+T'
command='x-terminal-emulator'
binding='<Control><Alt>t'

[org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom1]
name='Terminal Super+T'
command='sakura'
binding='<Super>t'

[org/gnome/shell]
favorite-apps=['calamares-install-debian.desktop', 'librewolf.desktop', 'rhythmbox.desktop', 'libreoffice-writer.desktop', 'org.gnome.Nautilus.desktop', 'org.gnome.Software.desktop', 'am-gui-AM.desktop']
EOF
sudo dconf update
## Tema escuro no LibreOffice
sudo tee /etc/apt/apt.conf.d/99libreoffice >/dev/null <<EOF
DPkg::Post-Invoke {
    "sed -i 's/value>auto/value>colibre_dark/' /etc/libreoffice/registry/main.xcd";
};
EOF
sudo sed -i 's/value>auto/value>colibre_dark/' /etc/libreoffice/registry/main.xcd