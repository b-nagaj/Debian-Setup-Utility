#!/bin/bash

# Runs each component of the setup utility in a sequential fashion

# Entry point
main() {
	./setup.sh
	./applications.sh
}

main
