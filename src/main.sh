#!/bin/bash

# Runs each component of the setup utility in a sequential fashion

# Import local modules
. ./update/updatePackageManager.sh
. ./install/installApplications.sh
. ./configure/configureGit.sh
. ./configure/configureGrub.sh
. ./configure/configureNFS.sh

# Entry point
main() {
	echo "Setting up your new Debian machine..."

	# Install/uninstall applications
	update_package_manager
	install

	# Custom Configurations
	configure_git_global_options
	create_nfs_mount_point
	mount_nfs
	configure_grub

	echo "Done!"
}

main
