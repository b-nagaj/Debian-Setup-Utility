#!/bin/bash

# Fetch most up-to-date packages from Debian 12 software repositories

# Fetch all of the latest updates for packages
update_package_manager() {
	echo "Fetching packages from Debian 12 software repositories..."
    sudo apt update
	echo "Packages fetched"
}
