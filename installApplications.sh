#!/bin/bash

# Installs each application listed in -> https://github.com/b-nagaj/Debian-Setup-Utility/tree/main?tab=readme-ov-file#current-list-of-applications

# Variables
DOWNLOADS_DIRECTORY="downloads/"

# Create a directory to store .deb packages
create_downloads_directory() {
    mkdir $DOWNLOADS_DIRECTORY
}

# Installs a static list of applications
install() {
    # Curl
    sudo apt install curl

    # Flatpak
    sudo apt install flatpak
    sudo apt install gnome-software-plugin-flatpak
    sudo flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo

    # Nala
    sudo apt install nala

    # Git
    sudo apt install git

    # GitK
    sudo apt install gitk

    # Node
    curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.1/install.sh | bash
    nvm install 22

    # Brave
    curl -fsS https://dl.brave.com/install.sh | sh

    # Bitwarden
    sudo flatpak install flathub com.bitwarden.desktop

    # Obsidian
    wget https://github.com/obsidianmd/obsidian-releases/releases/download/v1.7.7/obsidian_1.7.7_amd64.deb -P $DOWNLOADS_DIRECTORY
    sudo dpkg -i obsidian_1.7.7_amd64.deb

    # Proton Mail
    wget https://proton.me/download/mail/linux/1.6.1/ProtonMail-desktop-beta.deb -P $DOWNLOADS_DIRECTORY
    sudo dpkg -i ProtonMail-desktop-beta.deb

    # Proton VPN
    wget https://repo.protonvpn.com/debian/dists/stable/main/binary-all/protonvpn-stable-release_1.0.6_all.deb -P $DOWNLOADS_DIRECTORY
    sudo dpkg -i protonvpn-stable-release_1.0.6_all.deb
    sudo apt update
    sudo apt install proton-vpn-gnome-desktop

    # HomeBank
    sudo apt-get install homebank

    # Spotify
    curl -sS https://download.spotify.com/debian/pubkey_6224F9941A8AA6D1.gpg | sudo gpg --dearmor --yes -o /etc/apt/trusted.gpg.d/spotify.gpg
    echo "deb http://repository.spotify.com stable non-free" | sudo tee /etc/apt/sources.list.d/spotify.list
    sudo apt update
    sudo apt install spotify-client

    # DBeaver
    wget https://dbeaver.io/files/dbeaver-ce_latest_amd64.deb -P $DOWNLOADS_DIRECTORY
    sudo dpkg -i dbeaver-ce_latest_amd64.deb

    # VeraCrypt
    wget https://launchpad.net/veracrypt/trunk/1.26.14/+download/veracrypt-1.26.14-Debian-12-amd64.deb -P $DOWNLOADS_DIRECTORY
    sudo apt install libwxgtk3.2-1
    sudo dpkg -i veracrypt-1.26.14-Debian-12-amd64.deb

    # Okular
    sudo apt install okular

    # Visual Studio Code
    curl https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > microsoft.gpg
    curl https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > microsoft.gpg
    sudo sh -c 'echo "deb [arch=amd64,arm64,armhf signed-by=/etc/apt/keyrings/microsoft-archive-keyring.gpg] https://packages.microsoft.com/repos/code stable main" > /etc/apt/sources.list.d/vscode.list'
    sudo apt update
    sudo apt install code

    # Gnome Tray Icons
    sudo apt install libayatana-appindicator3-1 gir1.2-ayatanaappindicator3-0.1 gnome-shell-extension-appindicator

    # Sublime Text
    wget -qO - https://download.sublimetext.com/sublimehq-pub.gpg | gpg --dearmor | sudo tee /etc/apt/trusted.gpg.d/sublimehq-archive.gpg > /dev/null
    echo "deb https://download.sublimetext.com/ apt/stable/" | sudo tee /etc/apt/sources.list.d/sublime-text.list
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
    configure_grub
}

# Entry point
main() {
    echo "Installing your applications..."
    create_downloads_directory
    install
    echo "Installed"
}

main
