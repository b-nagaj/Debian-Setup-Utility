#!/bin/bash

# Installs each application listed in -> https://github.com/b-nagaj/Debian-Setup-Utility/tree/main?tab=readme-ov-file#current-list-of-applications

# Operations
INSTALL="sudo apt install"
UPDATE="sudo apt update"
UNPACK="sudo dpkg -i"

# Directories
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

# GPG Keys
SPOTIFY_GPG="https://download.spotify.com/debian/pubkey_C85668DF69375001.gpg"
SUBLIME_TEXT_GPG="https://download.sublimetext.com/sublimehq-pub.gpg"

# Repositories
SPOTIFY_REPOSITORY="deb http://repository.spotify.com stable non-free"
SUBLIME_TEXT_REPOSITORY="deb https://download.sublimetext.com/ apt/stable/"

# Create a dedicated directory for software downloaded from the web
create_downloads_directory() {
    echo "Creating a directory for downloads..."
    mkdir $DOWNLOADS_DIRECTORY
    echo "Created"
}

# Download packages from source
download_sources() {
    echo "Downloading packages from source..."
    curl -o- $NODE_SOURCE | bash
    curl -fsS $BRAVE_SOURCE | sh
    wget $OBSIDIAN_SOURCE -P $DOWNLOADS_DIRECTORY
    wget $PROTON_MAIL_SOURCE -P $DOWNLOADS_DIRECTORY
    wget $PROTON_VPN_SOURCE -P $DOWNLOADS_DIRECTORY
    wget $DBEAVER_CE_SOURCE -P $DOWNLOADS_DIRECTORY
    echo "Downloaded"
}

# Download GPG keys
download_gpg_keys() {
    echo "Downloading GPG keys..."
    curl -sS $SPOTIFY_GPG | sudo gpg --dearmor --yes -o $TRUSTED_KEYRINGS/spotify.gpg
    wget -qO - $SUBLIME_TEXT_GPG | gpg --dearmor | sudo tee $TRUSTED_KEYRINGS/sublimehq-archive.gpg > /dev/null
    echo "Downloaded"
}

# Update software repositories
update_software_repositories() {
    echo "Updating software repositories..."
    echo $SPOTIFY_REPOSITORY | sudo tee $APT_REPOSITORIES/spotify.list
    echo $SUBLIME_TEXT_REPOSITORY | sudo tee $APT_REPOSITORIES/sublime-text.list
    $UPDATE
    echo "Updated"
}

# Install packages with apt
install_apt_packages() {
    echo "Installing packages using apt..."
    $INSTALL curl -y
    $INSTALL flatpak -y
    $INSTALL gnome-software-plugin-flatpak -y
    $INSTALL nala -y
    $INSTALL git -y
    $INSTALL gitk -y
    $INSTALL homebank -y
    $INSTALL okular -y
    $INSTALL libayatana-appindicator3-1 -y
    $INSTALL gir1.2-ayatanaappindicator3-0.1 -y
    $INSTALL gnome-shell-extension-appindicator -y
    $INSTALL g++ -y
    $INSTALL make -y
    $INSTALL libboost-all-dev -y
    $INSTALL default-libmysqlclient-dev -y
    $INSTALL openssl -y
    $INSTALL libjsoncpp-dev -y
    $INSTALL grub -y
    $INSTALL proton-vpn-gnome-desktop -y
    $INSTALL spotify-client -y
    $INSTALL libwxgtk3.2-1 -y
    $INSTALL sublime-text -y
    $INSTALL git-cola -y
    $INSTALL nfs-common -y
    echo "Installed"
}

# Install packages with flatpak
install_flatpaks() {
    echo "Installing packages using flatpak..."
    sudo flatpak remote-add --if-not-exists flathub $FLATHUB_SOURCE
    sudo flatpak install flathub com.bitwarden.desktop -y
    echo "Installed"
}

# Install packages from source
install_source() {
    echo "Installing packages from source..."
    cd $DOWNLOADS_DIRECTORY
    $UNPACK $(basename "$OBSIDIAN_SOURCE")
    $UNPACK $(basename "$PROTON_MAIL_SOURCE")
    $UNPACK $(basename "$PROTON_VPN_SOURCE")
    $UNPACK $(basename "$DBEAVER_CE_SOURCE")
    cd ../
    echo "Installed"
}

# Install applications
install() {
    echo "Installing your applications..."
    create_downloads_directory
    download_sources
    download_gpg_keys
    update_software_repositories
    install_apt_packages
    install_flatpaks
    install_source
    echo "Installed"
}
