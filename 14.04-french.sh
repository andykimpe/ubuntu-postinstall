#!/bin/bash
sudo rm -f /etc/apt/sources.list.d/proposed.list
sudo rm -f /etc/apt/sources.list.d/proposed.list.save
sudo sh -c 'echo "deb http://fr.archive.ubuntu.com/ubuntu/ trusty main restricted universe multiverse" > /etc/apt/sources.list'
sudo sh -c 'echo "deb-src http://fr.archive.ubuntu.com/ubuntu/ trusty main restricted universe multiverse" >> /etc/apt/sources.list'
sudo sh -c 'echo "deb http://security.ubuntu.com/ubuntu trusty-security main restricted universe multiverse" >> /etc/apt/sources.list'
sudo sh -c 'echo "deb-src http://security.ubuntu.com/ubuntu trusty-security main restricted universe multiverse" >> /etc/apt/sources.list'
sudo sh -c 'echo "deb http://fr.archive.ubuntu.com/ubuntu/ trusty-updates main restricted universe multiverse" >> /etc/apt/sources.list'
sudo sh -c 'echo "deb-src http://fr.archive.ubuntu.com/ubuntu/ trusty-updates main restricted universe multiverse" >> /etc/apt/sources.list'
sudo apt-get update
sudo apt-get -y dist-upgrade
sudo apt-get -y install language-pack-fr thunderbird-locale-en-us libreoffice-l10n-en-za hyphen-en-us myspell-en-au
sudo apt-get -y install thunderbird-locale-en-gb firefox-locale-fr libreoffice-help-fr mythes-en-us
sudo apt-get -y install openoffice.org-hyphenation wbritish hunspell-en-ca mythes-fr thunderbird-locale-fr
sudo apt-get -y install myspell-en-za myspell-en-gb mythes-en-au libreoffice-l10n-fr libreoffice-l10n-en-gb
sudo apt-get -y install libreoffice-help-en-gb wfrench language-pack-gnome-fr hyphen-fr hunspell-fr
sudo apt-get -y install thunderbird-locale-en
sudo apt-get -y install squashfs-tools schroot genisoimage
