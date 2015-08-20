#!/bin/bash
# verification du systeme
if [ -f /etc/lsb-release ]; then
OS=$(grep DISTRIB_ID /etc/lsb-release | sed 's/^.*=//')
VER=$(grep DISTRIB_RELEASE /etc/lsb-release | sed 's/^.*=//')
else
OS=$(uname -s)
VER=$(uname -r)
fi
ARCH=$(uname -m)
echo "Systeme Detecter : $OS  $VER  $ARCH"
if [[ "$OS" = "Ubuntu" && "$VER" = "14.04" ]] ; then 
echo "Ok."
else
echo "Ce script est prevue pour fonctionner uniquement sur Ubuntu 14.04 Trusty LTS." 
exit 1
fi
# Suppression du depot proposed
# L'activation de ce depot n'est pas recomender sur le long terme
sudo rm -f /etc/apt/sources.list.d/proposed.list
sudo rm -f /etc/apt/sources.list.d/proposed.list.save
# Configuration des depots de base
sudo sh -c 'echo "deb http://fr.archive.ubuntu.com/ubuntu/ trusty main restricted universe multiverse" > /etc/apt/sources.list'
sudo sh -c 'echo "deb-src http://fr.archive.ubuntu.com/ubuntu/ trusty main restricted universe multiverse" >> /etc/apt/sources.list'
sudo sh -c 'echo "deb http://security.ubuntu.com/ubuntu trusty-security main restricted universe multiverse" >> /etc/apt/sources.list'
sudo sh -c 'echo "deb-src http://security.ubuntu.com/ubuntu trusty-security main restricted universe multiverse" >> /etc/apt/sources.list'
sudo sh -c 'echo "deb http://fr.archive.ubuntu.com/ubuntu/ trusty-updates main restricted universe multiverse" >> /etc/apt/sources.list'
sudo sh -c 'echo "deb-src http://fr.archive.ubuntu.com/ubuntu/ trusty-updates main restricted universe multiverse" >> /etc/apt/sources.list'
sudo sh -c 'echo "deb http://archive.canonical.com/ubuntu trusty partner" >> /etc/apt/sources.list'
sudo sh -c 'echo "deb-src http://archive.canonical.com/ubuntu trusty partner" >> /etc/apt/sources.list'
# Activation du depot libreoffice
sudo add-apt-repository ppa:libreoffice/ppa -y
# Activation du depot trusty media
sudo add-apt-repository ppa:mc3man/trusty-media -y
# Activation du depot wine1.7
sudo add-apt-repository ppa:ubuntu-wine/ppa -y
# Activation du depot Winff
sudo add-apt-repository ppa:paul-climbing/ppa -y
# Activation du depot avidemux
sudo add-apt-repository ppa:rebuntu16/avidemux+unofficial -y
# Activation du depot playonlinux
wget -q "http://deb.playonlinux.com/public.gpg" -O- | sudo apt-key add -
sudo wget http://deb.playonlinux.com/playonlinux_trusty.list -O /etc/apt/sources.list.d/playonlinux.list
# Activation du depot multisystem
sudo sh -c 'echo "deb http://liveusb.info/multisystem/depot all main" > /etc/apt/sources.list.d/multisystem.list'
wget -q http://liveusb.info/multisystem/depot/multisystem.asc -O- | sudo apt-key add -
# Activation du depot  remmina
sudo apt-add-repository ppa:remmina-ppa-team/remmina-next -y
# Mise a jour de la liste des pacquet
sudo apt-get update
# Mise a jour du systeme
sudo apt-get -y dist-upgrade
# Installation de la tranduction francaise
sudo apt-get -y install language-pack-fr thunderbird-locale-en-us libreoffice-l10n-en-za hyphen-en-us myspell-en-au
sudo apt-get -y install thunderbird-locale-en-gb firefox-locale-fr libreoffice-help-fr mythes-en-us
sudo apt-get -y install openoffice.org-hyphenation wbritish hunspell-en-ca mythes-fr thunderbird-locale-fr
sudo apt-get -y install myspell-en-za myspell-en-gb mythes-en-au libreoffice-l10n-fr libreoffice-l10n-en-gb
sudo apt-get -y install libreoffice-help-en-gb wfrench language-pack-gnome-fr hyphen-fr hunspell-fr
sudo apt-get -y install thunderbird-locale-en
# Installation des paquets necessaire a la modification des live cd
sudo apt-get -y install squashfs-tools schroot genisoimage
# Installation de Chromium
sudo apt-get -y install chromium-browser
# Installation de flashplayr pour Chromium
sudo apt-get -y install pepperflashplugin-nonfree
sudo update-pepperflashplugin-nonfree --install
# Installation de flashplayr pour Firefox
sudo add-apt-repository -y ppa:nilarimogard/webupd8
sudo apt-get update
sudo apt-get -y install freshplayerplugin
sudo add-apt-repository -y --remove ppa:nilarimogard/webupd8
sudo apt-get update
# Installation des greffons gstreamer
sudo apt-get -y install gstreamer0.10-ffmpeg gstreamer0.10-plugins-ugly gstreamer0.10-fluendo-mp3
# Installation de vlc
sudo apt-get -y install vlc
# Installation de ffmpeg et winff
sudo apt-get -y install ffmpeg winff
# Installation de avidemux
sudo apt-get -y install avidemux2.6-gtk avidemux2.6-qt4
# Installation de skype
sudo apt-get -y install skype
#Installation de xgo2 client
sudo apt-get -y install x2goclient
# reactivation du depot proposed pour l'installation de wine
sudo sh -c 'echo "deb http://fr.archive.ubuntu.com/ubuntu/ trusty-proposed main restricted universe multiverse" > /etc/apt/sources.list.d/proposed.list'
sudo sh -c 'echo "deb-src http://fr.archive.ubuntu.com/ubuntu/ trusty-proposed main restricted universe multiverse" >> /etc/apt/sources.list.d/proposed.list'
# installation de wine1.7
if [[ "$ARCH" == "x86_64" ]]; then
sudo dpkg --add-architecture i386
fi
sudo apt-get update
sudo apt-get -y install wine1.7
# Suppression du depot proposed
# L'activation de ce depot n'est pas recomender sur le long terme
sudo rm -f /etc/apt/sources.list.d/proposed.list
sudo rm -f /etc/apt/sources.list.d/proposed.list.save
sudo apt-get update
# Installation de playonlinux
sudo apt-get -y install playonlinux
# Installation de remmina
sudo apt-get -y install remmina remmina-plugin-rdp
# Installation de git
sudo apt-get -y install git
# Installation de multisystem
sudo apt-get -y install multisystem
# Installation des outils Launchpad
sudo apt-get -y install debhelper cdbs lintian build-essential fakeroot devscripts pbuilder dh-make debootstrap
# Netoyage des paquets superflu
sudo apt-get -y autoremove
# Netoyage du cache de apt
sudo apt-get clean
# Installation configuration antipubweb + lastpass
# Comprend toutes la configuration antipub du site antipubweb.org + le module de securite de mot de passe lastpass
# Notes vous n'estes pas obligez d'avoir un compte lastpass premium pour utiliser l'extenssion dans votre navigateur.
rm -rf /ect/skel/.mozilla
rm -rf /ect/skel/.config/chromium
export dir=$PWD
cd /
sudo wget --no-check-certificat https://raw.githubusercontent.com/andykimpe/ubuntu-postinstall/master/Ubuntu-14.04-The-Trusty-Tahr-Long-Term-Support/antipubweb.tar.gz
sudo tar -xvf antipubweb.tar.gz
sudo rm -f antipubweb.tar.gz
cd $dir
if [ -d "$HOME" ];then
rm -rf $HOME/.mozilla
rm -rf $HOME/.config/chromium
mkdir $HOME/.mozilla
mkdir $HOME/.config/chromium
cp -R /ect/skel/.mozilla/* $HOME/.mozilla
cp -R /ect/skel/.config/chromium/* $HOME/.config/chromium
fi
