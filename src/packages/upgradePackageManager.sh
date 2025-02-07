#!/bin/bash

# Performs an upgrade for all available packages

# Upgrades packages
upgrade_package_manager() {
	echo "Upgrading all available packages..."
	sudo apt upgrade -y
	echo "Upgraded"
}
