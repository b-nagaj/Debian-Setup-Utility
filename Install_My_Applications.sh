#!/bin/bash

# aliases
JETBRAINS_TOOLBOX_DIRECTORY=$(find -name "*jetbrains-toolbox*" -type d)

SNAP="snapd"
CURL="curl"
C_PLUS_PLUS="build-essential"
MAKE="make"
BOOST="libboost-all-dev"
MY_SQL="default-libmysqlclient-dev"
NODE="nodejs"
VIM="vim"
THUNDERBIRD="thunderbird"
HOMEBANK="homebank"
SPOTIFY="spotify-client"
SUBLIME="sublime-text"
GNOME_TWEAKS="gnome-tweaks"
GIT="git gitk"

DBEAVER="*dbeaver-ce*.deb"
BITWARDEN="*Bitwarden*.deb"
GOOGLE_CHROME="*google-chrome-stable*.deb"
OBSIDIAN="*obsidian*.deb"
VISUAL_STUDIO_CODE="*code*.deb"
VERACRYPT="*veracrypt*.deb"

JETBRAINS_TOOLBOX="*jetbrains-toolbox*.tar.gz"

# update package manager
sudo apt update
sudo apt upgrade -y

# install prerequisites
sudo apt install $SNAP $CURL -y

# install programming libraries
curl -fsSL https://deb.nodesource.com/setup_22.x
sudo apt install $C_PLUS_PLUS $MAKE $BOOST $MY_SQL $NODE -y

# install applications via package manager
sudo add-apt-repository ppa:mdoyen/homebank
curl -sS https://download.spotify.com/debian/pubkey_6224F9941A8AA6D1.gpg | sudo gpg --dearmor --yes -o /etc/apt/trusted.gpg.d
echo "deb http://repository.spotify.com stable non-free" | sudo tee /etc/apt/sources.list.d/spotify.list
wget -qO - https://download.sublimetext.com/sublimehq-pub.gpg | gpg --dearmor | sudo tee /etc/apt/trusted.gpg.d/sublimehq-archive.gpg > /dev/null
echo "deb https://download.sublimetext.com/ apt/stable/" | sudo tee /etc/apt/sources.list.d/sublime-text.list
sudo apt update
sudo apt install $VIM $THUNDERBIRD $HOMEBANK $SPOTIFY $SUBLIME $GNOME_TWEAKS $GIT -y

# install applications via .deb
sudo apt install libccid libpcre2-32-0 libwxbase3.2-1 libwxgtk3.2-1 pcscd
sudo dpkg -i $DBEAVER $BITWARDEN $GOOGLE_CHROME $OBSIDIAN $VISUAL_STUDIO_CODE $VERACRYPT

# install applications via .tar.gz
sudo tar xzf $JETBRAINS_TOOLBOX
cd $JETBRAINS_TOOLBOX_DIRECTORY
./jetbrains-toolbox

echo "done!"
