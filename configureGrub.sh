#!/bin/bash

# Probe for the list of installed operating systems on the machine
# then update grub accordingly

# Updates the grub configuration
configure_grub() {
	sudo os-prober
	sudo update-grub
}
