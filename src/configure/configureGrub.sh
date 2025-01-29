#!/bin/bash

# Probe for the list of installed operating systems on the machine
# then update grub accordingly

# Update the grub configuration file at /boot/grub/grub.conf
configure_grub() {
	echo "Updating the grub configuration file"
	sudo os-prober
	sudo update-grub
	echo "Updated"
}
