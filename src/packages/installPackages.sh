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
OBSIDIAN_SOURCE="https://github.com/obsidianmd/obsidian-releases/releases/download/v1.8.9/obsidian_1.8.9_amd64.deb"
PROTON_MAIL_SOURCE="https://proton.me/download/mail/linux/1.8.0/ProtonMail-desktop-beta.deb"
PROTON_PASS_SOURCE="https://proton.me/download/pass/linux/proton-pass_1.30.1_amd64.deb"
DBEAVER_CE_SOURCE="https://dbeaver.io/files/dbeaver-ce_latest_amd64.deb"
BITWARDEN_SOURCE="https://bitwarden.com/download/?app=desktop&platform=linux&variant=deb"

# GPG Keys
SUBLIME_TEXT_GPG="https://download.sublimetext.com/sublimehq-pub.gpg"
BRAVE_GPG="/usr/share/keyrings/brave-browser-archive-keyring.gpg https://brave-browser-apt-release.s3.brave.com/brave-browser-archive-keyring.gpg"

# Repositories
SUBLIME_TEXT_REPOSITORY="deb https://download.sublimetext.com/ apt/stable/"
BRAVE_REPOSITORY="deb [signed-by=/usr/share/keyrings/brave-browser-archive-keyring.gpg] https://brave-browser-apt-release.s3.brave.com/ stable main"

# Create a dedicated directory for software downloaded from the web
create_downloads_directory() {
    echo "Creating a directory for downloads..."
    mkdir $DOWNLOADS_DIRECTORY
    echo "Created"
}

# Download packages from source
download_sources() {
    echo "Downloading packages from source..."
    wget $OBSIDIAN_SOURCE -P $DOWNLOADS_DIRECTORY
    wget $PROTON_MAIL_SOURCE -P $DOWNLOADS_DIRECTORY
    wget $PROTON_PASS_SOURCE -P $DOWNLOADS_DIRECTORY
    wget $DBEAVER_CE_SOURCE -P $DOWNLOADS_DIRECTORY
    echo "Downloaded"
}

# Download GPG keys
download_gpg_keys() {
    echo "Downloading GPG keys..."
    wget -qO - $SUBLIME_TEXT_GPG | gpg --dearmor | sudo tee $TRUSTED_KEYRINGS/sublimehq-archive.gpg > /dev/null
    curl -fsSLo $BRAVE_SOURCE
    echo "Downloaded"
}

# Update software repositories
update_software_repositories() {
    echo "Updating software repositories..."
    echo $SUBLIME_TEXT_REPOSITORY | sudo tee $APT_REPOSITORIES/sublime-text.list
    echo $BRAVE_REPOSITORY | sudo tee $APT_REPOSITORIES/brave-browser-release.list
    $UPDATE
    echo "Updated"
}

# Install packages with apt
install_apt_packages() {
    echo "Installing packages using apt..."
    $INSTALL curl -y
    $INSTALL snap -y
    $INSTALL snapd -y
    $INSTALL nala -y
    $INSTALL git -y
    $INSTALL homebank -y
    $INSTALL okular -y
    $INSTALL g++ -y
    $INSTALL make -y
    $INSTALL libboost-all-dev -y
    $INSTALL default-libmysqlclient-dev -y
    $INSTALL openssl -y
    $INSTALL libjsoncpp-dev -y
    $INSTALL grub -y
    $INSTALL libwxgtk3.2-1 -y
    $INSTALL sublime-text -y
    $INSTALL git-cola -y
    $INSTALL nfs-common -y
    $INSTALL brave-browser
    echo "Installed"
}

# Install packages with snap
install_snaps() {
    echo "Installing packages using snap..."
    sudo snap install bitwarden
    sudo snap install spotify
    echo "Installed"
}

# Install packages from source
install_source() {
    echo "Installing packages from source..."
    cd $DOWNLOADS_DIRECTORY
    $UNPACK $(basename "$OBSIDIAN_SOURCE")
    $UNPACK $(basename "$PROTON_MAIL_SOURCE")
    $UNPACK $(basename "$PROTON_PASS_SOURCE")
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
    install_snaps
    install_source
    echo "Installed"
}
