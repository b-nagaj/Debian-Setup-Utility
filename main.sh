#!/bin/bash

# Runs each component of the setup utility in a sequential fashion

# Entry point
main() {
	./updatePackageManager.sh
	./applications.sh
	./configureNFS.sh
}

main
