#!/bin/bash

# Fetch most up-to-date packages from Debian 12 software repositories

# Fetches all of the latest updates for packages
update_package_manager() {
    sudo apt update
}

# Entry point
main() {
	echo "Fetching packages from Debian 12 software repositories"
	update_package_manager
	echo "Packages fetched"
}

main
