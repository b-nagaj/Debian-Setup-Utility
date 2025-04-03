#!/bin/bash

# Runs each component of the setup utility in a sequential fashion

# Store working directory
CURRENT_WORKING_DIRECTORY=$(dirname $0)

# Import local modules
. $CURRENT_WORKING_DIRECTORY/packages/updatePackageManager.sh
. $CURRENT_WORKING_DIRECTORY/packages/installPackages.sh
. $CURRENT_WORKING_DIRECTORY/packages/purgePackages.sh
. $CURRENT_WORKING_DIRECTORY/packages/upgradePackageManager.sh
. $CURRENT_WORKING_DIRECTORY/configure/configureGit.sh

# Entry point
main() {
	echo "Setting up your new Debian machine..."
	# Manage packages
	update_package_manager
	install
	purge
	upgrade_package_manager

	# Enforce custom configurations
	configure_git_global_options
	echo "Done!"
}

main
