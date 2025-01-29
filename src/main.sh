#!/bin/bash

# Runs each component of the setup utility in a sequential fashion

# Entry point
main() {
	echo "Setting up your new Debian machine..."
	./updatePackageManager.sh
	./applications.sh
	./configureNFS.sh
	echo "Done!"
}

main
