#!/bin/bash

function pause(){
	read -s -n 1 -p "Precione qualquer botão para continuar..."
	echo ""
}

# Variáveis de cores
RED='\033[0;31m'
GREEN='\033[0;32m'        
YELLOW='\033[0;33m'
CYAN='\033[0;36m'
BLUE='\033[00;34m'
PURPLE='\033[00;35m'
LIGHTGRAY='\033[00;37m'
LRED='\033[01;31m'
LGREEN='\033[01;32m'
LYELLOW='\033[01;33m'
LBLUE='\033[01;34m'
LPURPLE='\033[01;35m'
LCYAN='\033[01;36m'
WHITE='\033[01;37m'
OFF='\033[0m'

#Variável de localização
LOCATION=$HOME/.config/autostart

clear
echo -e "${LCYAN} *** BEM VINDO AO INSTALADOR DE COMPLEMENTOS DO GNOME. *** ${OFF}"
sleep 6
echo -e "${GREEN} *** INSTALANDO O AUR-HELPER(YAY). *** ${OFF}"
pause
#sleep 3
git clone https://aur.archlinux.org/yay.git
cd $HOME/archupdate/yay/
makepkg -si --noconfirm
yay -Syu --noconfirm
echo -e "${BLUE} *** INSTALANDO COMPLEMENTOS GNOME. *** ${OFF}"
sleep 3
yay -S --noconfirm file-roller secrets fragments impression evolution evolution-ews evolution-data-server evolution-on evolution-spamassassin gnome-browser-connector gnome-boxes gnome-connections showtime lollypop
echo -e "${PURPLE} *** INSTALANDO PACOTES ADICIONAIS. *** ${OFF}"
sleep 3
yay -S --noconfirm --needed conky-lua-nv lsb-release zsh testdisk p7zip unrar unzip zip aic94xx-firmware linux-firmware-qlogic wd719x-firmware upd72020x-fw ffmpeg ffmpegthumbs ffmpegthumbnailer firefox firefox-i18n-pt-br libreoffice-fresh-pt-br libreoffice-extension-vero libreoffice-impress-templates aspell-pt ttf-ms-fonts ttf-ubuntu-font-family ttf-nerd-fonts-symbols ttf-nerd-fonts-symbols-mono ttf-roboto ttf-roboto-mono dosfstools ttf-font-logos ttf-font-awesome-5 nerd-fonts-git gst-plugins-base gst-plugins-good gst-plugins-bad gst-plugins-ugly vim yt-dlp youtube-dl starship zsh-autocomplete-git zsh-syntax-highlighting-git zsh-autosuggestions-git plymouth smbclient gvfs gvfs-goa gvfs-google gvfs-smb sshfs gvfs gvfs-goa gvfs-google gvfs-smb sshfs ntfs-3g epson-inkjet-printer-escpr cups ghostscript gsfonts gst-ffmpeg gstreamer ocean-sound-theme checkupdates-with-aur hunspell-pt-br gimp shc unshc linux-headers archupdate-appstream-data fwupd gnome-shell-extension-arch-update python-pipx morewaita-icon-theme mesa-utils xfsprogs f2fs-tools exfat-utils udftools vorbis-tools ast-firmware creality-print epson-inkjet-printer-escpr visual-studio-code-bin ttf-google-fonts pitivi obs-studio inkscape hplip python-pyqt5 frei0r-plugins gst-libav gst-plugin-opencv python-librosa
echo -e "${YELLOW} *** ALTERAÇÃO DO SHELL PADRÃO PARA O (ZSH). *** ${OFF}"
sleep 3
chsh -s /bin/zsh
echo -e "${LIGHTGRAY} *** INSTALANDO ARQUIVOS DE CONFIG. ZSH. *** ${OFF}"
sleep 3
cd $HOME/archupdate/
cp -r zsh $HOME/.config
cp starship.toml $HOME/.config/
cp zshrc $HOME/.zshrc
echo -e "${LPURPLE} *** INSTALANDO ESQUEMAS DE SOM *** ${OFF}"
sleep 3
cd $HOME/archupdate/
sudo cp -r harmony2 modern_Minimal_UI /usr/share/sounds
echo -e "${LYELLOW} *** ATUALIZANDO MAIS ALGUMAS COISAS. *** ${OFF}"
sleep 3
sudo systemctl enable --now bluetooth.service cups.service
sudo fc-cache -vf
gsettings set org.gnome.desktop.interface icon-theme 'MoreWaita'
gsettings set org.gnome.desktop.sound theme-name 'Modern Minimal UI'
gsettings set org.gnome.desktop.peripherals.touchpad send-events disabled-on-external-mouse
echo -e "${LGREEN} *** REINICIANDO MOD DA CAMERA! *** ${OFF}"
sleep 3
sudo modprobe -r uvcvideo 
sudo modprobe uvcvideo
echo -e "${LBLUE} *** CRIANDO DIRETÓRIO NECESSÁRIOS. *** ${OFF}"
sleep 3
if [ -e "/home/edison/.config/autostart" ]
then
	echo "${LRED}--- O DIRETÓRIO JÁ EXISTE. ---${OFF}"
	else
	echo "${LPURPLE}--- O DIRETÓRIO NÃO EXISTE E SERÁ CRIADO. ---${OFF}"
	mkdir -p /home/edison/.config/autostart/
	fi
echo -e "${LCYAN} *** COPIANDO ARQUIVOS PARA O DIRETÓRIO CRIADO. *** ${OFF}"
sleep 3
cd /$HOME/archupdate/
cp conky.desktop $HOME/.config/autostart/
cp conkyrc $HOME/.conkyrc
cp get_DE $HOME/.get_DE
cp draw_bg.lua $HOME/.draw_bg.lua
cp verifica_servico.sh $HOME/.verifica_servico.sh && sudo chmod 755 $HOME/.verifica_servico.sh
cp vimrc $HOME/.vimrc
echo -e "${YELLOW} *** INSTALANDO CONFIGURAÇÕES DO GREETER. *** ${OFF}"
sleep 3
cd /$HOME/archupdate/
sudo mkdir -p /etc/dconf/profile/ && sudo cp gdm /etc/dconf/profile/
sudo mkdir -p /etc/dconf/db/gdm.d/ && sudo cp 01-logo /etc/dconf/db/gdm.d/ && sudo cp greeter-logo.png /usr/share/pixmaps/
sudo cp eu.png /usr/share/pixmaps/faces/
sudo dconf update
echo -e "${PURPLE} *** INSTALANDO PAPEIS DE PAREDE PERSONALIZADOS. *** ${OFF}"
sleep 3
cd /$HOME/archupdate/
sudo cp -r custom /usr/share/backgrounds/ && sudo cp custom.xml /usr/share/gnome-background-properties/
echo -e "${LPURPLE} *** INSTALANDO EXTENSÕES DO GNOME... *** ${OFF}"
sleep 3
#git clone https://aur.archlinux.org/gnome-shell-extension-desktop-icons-ng-git.git
#cd /$HOME/archupdate/gnome-shell-extension-desktop-icons-ng-git && makepkg -si --noconfirm
#cd ..
git clone https://aur.archlinux.org/gnome-shell-extension-gtk4-desktop-icons-ng.git
cd /$HOME/archupdate/gnome-shell-extension-gtk4-desktop-icons-ng && makepkg -si --noconfirm
cd ..
git clone https://aur.archlinux.org/gnome-shell-extension-bluetooth-battery-meter-git.git
cd /$HOME/archupdate/gnome-shell-extension-bluetooth-battery-meter-git && makepkg -si --noconfirm
cd ..
git clone https://aur.archlinux.org/gnome-shell-extension-appindicator-git.git
cd /$HOME/archupdate/gnome-shell-extension-appindicator-git && makepkg -si --noconfirm
cd ..
#git clone https://aur.archlinux.org/gnome-shell-extension-dash-to-panel
#cd /$HOME/archupdate/gnome-shell-extension-dash-to-panel-git && makepkg -si --noconfirm
#cd ..
git clone https://aur.archlinux.org/gnome-shell-extension-dash-to-dock.git
cd /$HOME/archupdate/gnome-shell-extension-dash-to-dock && makepkg -si --noconfirm
cd ..
sleep 3
echo -e "${WHITE} *** INSTALAÇÃO DE COMPLEMENTOS BEM SUCEDIDO... *** ${OFF}"
sleep 3
echo -e "${GREEN} *** ATUALIZANDO E REMOVENDO APPs DESNECESSÁRIOS. *** ${OFF}"
yay -Syu --noconfirm && yay -Rsnc --noconfirm gnome-contacts gnome-maps gnome-weather gnome-characters gnome-clocks gnome-software epiphany htop gnome-tour fontforge totem decibels gnome-music
sleep 3
echo -e "${LRED} *** ATUALIZAÇÕES BEM SUCEDIDAS...! *** ${OFF}"
sleep 3
echo -e "${LRED} *** AGUARDE O REINICIO DO SISTEMA...! *** ${OFF}"
sleep 6
reboot
