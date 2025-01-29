#!/bin/bash

# Installs each application listed in -> https://github.com/b-nagaj/Debian-Setup-Utility/tree/main?tab=readme-ov-file#current-list-of-applications

# Constants
DOWNLOADS_DIRECTORY="downloads/"
TRUSTED_KEYRINGS="/etc/apt/trusted.gpg.d"
APT_REPOSITORIES="/etc/apt/sources.list.d"

# Sources
FLATHUB_SOURCE="https://dl.flathub.org/repo/flathub.flatpakrepo"
NODE_SOURCE="https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.1/install.sh"
BRAVE_SOURCE="https://dl.brave.com/install.sh"
OBSIDIAN_SOURCE="https://github.com/obsidianmd/obsidian-releases/releases/download/v1.7.7/obsidian_1.7.7_amd64.deb"
PROTON_MAIL_SOURCE="https://proton.me/download/mail/linux/1.6.1/ProtonMail-desktop-beta.deb"
PROTON_VPN_SOURCE="https://repo.protonvpn.com/debian/dists/stable/main/binary-all/protonvpn-stable-release_1.0.6_all.deb"
DBEAVER_CE_SOURCE="https://dbeaver.io/files/dbeaver-ce_latest_amd64.deb"
VERACRYPT_SOURCE="https://launchpad.net/veracrypt/trunk/1.26.14/+download/veracrypt-1.26.14-Debian-12-amd64.deb"

# GPG Keys
SPOTIFY_GPG="https://download.spotify.com/debian/pubkey_6224F9941A8AA6D1.gpg"
SUBLIME_TEXT_GPG="https://download.sublimetext.com/sublimehq-pub.gpg"

# Repositories
SPOTIFY_REPOSITORY="deb http://repository.spotify.com stable non-free"
SUBLIME_TEXT_REPOSITORY="deb https://download.sublimetext.com/ apt/stable/"

# Create a directory to store .deb packages
create_downloads_directory() {
    mkdir $DOWNLOADS_DIRECTORY
    cd $DOWNLOADS_DIRECTORY
}

# Install a static list of applications
install() {
    echo "Installing your applications..."
    create_downloads_directory

    # Curl
    sudo apt install curl
    # Flatpak
    sudo apt install flatpak
    sudo apt install gnome-software-plugin-flatpak
    sudo flatpak remote-add --if-not-exists flathub $FLATHUB_SOURCE
    # Nala
    sudo apt install nala
    # Git
    sudo apt install git
    # GitK
    sudo apt install gitk
    # Node
    curl -o- $NODE_SOURCE | bash
    nvm install 22
    # Brave
    curl -fsS $BRAVE_SOURCE | sh
    # Bitwarden
    sudo flatpak install flathub com.bitwarden.desktop
    # Obsidian
    wget $OBSIDIAN_SOURCE -P $DOWNLOADS_DIRECTORY
    sudo dpkg -i $(basename "$OBSIDIAN_SOURCE")
    # Proton Mail
    wget $PROTON_MAIL_SOURCE -P $DOWNLOADS_DIRECTORY
    sudo dpkg -i $(basename "$PROTON_MAIL_SOURCE")
    # Proton VPN
    wget $PROTON_VPN_SOURCE -P $DOWNLOADS_DIRECTORY
    sudo dpkg -i $PROTON_VPN_SOURCE
    sudo apt update
    sudo apt install proton-vpn-gnome-desktop
    # HomeBank
    sudo apt-get install homebank
    # Spotify
    curl -sS $SPOTIFY_GPG | sudo gpg --dearmor --yes -o $TRUSTED_KEYRINGS/spotify.gpg
    echo $SPOTIFY_REPOSITORY | sudo tee $APT_REPOSITORIES/spotify.list
    sudo apt update
    sudo apt install spotify-client
    # DBeaver
    wget $DBEAVER_CE_SOURCE -P $DOWNLOADS_DIRECTORY
    sudo dpkg -i $(basename "$DBEAVER_CE_SOURCE")
    # VeraCrypt
    wget $VERACRYPT_SOURCE -P $DOWNLOADS_DIRECTORY
    sudo apt install libwxgtk3.2-1
    sudo dpkg -i $(basename "$VERACRYPT_SOURCE")
    # Okular
    sudo apt install okular
    # Gnome Tray Icons
    sudo apt install libayatana-appindicator3-1 gir1.2-ayatanaappindicator3-0.1 gnome-shell-extension-appindicator
    # Sublime Text
    wget -qO - $SUBLIME_TEXT_GPG | gpg --dearmor | sudo tee $TRUSTED_KEYRINGS/sublimehq-archive.gpg > /dev/null
    echo $SUBLIME_TEXT_REPOSITORY | sudo tee $APT_REPOSITORIES/sublime-text.list
    sudo apt update
    sudo apt install sublime-text
    # g++
    sudo apt install g++
    # GNU Make
    sudo apt install make
    # Boost
    sudo apt install libboost-all-dev
    # OpenSSL
    sudo apt install libboost-all-dev
    # JsonCpp
    sudo apt install ibcurl4-openssl-dev
    # MySQL
    sudo apt install default-libmysqlclient-dev
    # Grub
    sudo apt install grub
    echo "Installed"
}
