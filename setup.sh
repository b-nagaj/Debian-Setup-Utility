#!/bin/bash

# Completes necessary prerequisites for installing new software

# Fetches all of the latest updates for packages
update_package_manager() {
    sudo apt update
}

# Upgrades all out-dated packages
upgrade_package_manager() {
    sudo apt upgrade -y
}

# Create a new directory to mount an NFS
create_nfs_mount() {
    mkdir /home/bryce/Sync
}

# Create a downloads directory to store .deb packages
create_downloads_directory() {
    mkdir downloads/
}

# Entry point
main() {
    update_package_manager
    upgrade_package_manager
    create_nfs_mount
    create_downloads_directory
}

main
