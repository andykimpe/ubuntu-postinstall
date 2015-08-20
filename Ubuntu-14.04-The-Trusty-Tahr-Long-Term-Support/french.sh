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
# suppression du depot proposed
# l'activation de ce depot n'est pas recomender sur le long terme
sudo rm -f /etc/apt/sources.list.d/proposed.list
sudo rm -f /etc/apt/sources.list.d/proposed.list.save
# configuration des depots
sudo sh -c 'echo "deb http://fr.archive.ubuntu.com/ubuntu/ trusty main restricted universe multiverse" > /etc/apt/sources.list'
sudo sh -c 'echo "deb-src http://fr.archive.ubuntu.com/ubuntu/ trusty main restricted universe multiverse" >> /etc/apt/sources.list'
sudo sh -c 'echo "deb http://security.ubuntu.com/ubuntu trusty-security main restricted universe multiverse" >> /etc/apt/sources.list'
sudo sh -c 'echo "deb-src http://security.ubuntu.com/ubuntu trusty-security main restricted universe multiverse" >> /etc/apt/sources.list'
sudo sh -c 'echo "deb http://fr.archive.ubuntu.com/ubuntu/ trusty-updates main restricted universe multiverse" >> /etc/apt/sources.list'
sudo sh -c 'echo "deb-src http://fr.archive.ubuntu.com/ubuntu/ trusty-updates main restricted universe multiverse" >> /etc/apt/sources.list'
sudo sh -c 'echo "deb http://archive.canonical.com/ubuntu trusty partner" >> /etc/apt/sources.list'
sudo sh -c 'echo "deb-src http://archive.canonical.com/ubuntu trusty partner" >> /etc/apt/sources.list'
# activation du depot trusty media
sudo add-apt-repository ppa:mc3man/trusty-media -y
# mise a jour de la liste des pacquet
sudo apt-get update
sudo apt-get -y dist-upgrade
sudo apt-get -y install language-pack-fr thunderbird-locale-en-us libreoffice-l10n-en-za hyphen-en-us myspell-en-au
sudo apt-get -y install thunderbird-locale-en-gb firefox-locale-fr libreoffice-help-fr mythes-en-us
sudo apt-get -y install openoffice.org-hyphenation wbritish hunspell-en-ca mythes-fr thunderbird-locale-fr
sudo apt-get -y install myspell-en-za myspell-en-gb mythes-en-au libreoffice-l10n-fr libreoffice-l10n-en-gb
sudo apt-get -y install libreoffice-help-en-gb wfrench language-pack-gnome-fr hyphen-fr hunspell-fr
sudo apt-get -y install thunderbird-locale-en
sudo apt-get -y install squashfs-tools schroot genisoimage
sudo add-apt-repository ppa:ubuntu-wine/ppa -y
if [[ "$ARCH" == "x86_64" ]]; then
sudo dpkg --add-architecture i386
fi
sudo sh -c 'echo "deb http://fr.archive.ubuntu.com/ubuntu/ trusty-proposed main restricted universe multiverse" > /etc/apt/sources.list.d/proposed.list'
sudo sh -c 'echo "deb-src http://fr.archive.ubuntu.com/ubuntu/ trusty-proposed main restricted universe multiverse" >> /etc/apt/sources.list.d/proposed.list'
sudo apt-get update
sudo apt-get -y install wine1.7
sudo rm -f /etc/apt/sources.list.d/proposed.list
sudo rm -f /etc/apt/sources.list.d/proposed.list.save
sudo apt-get update
