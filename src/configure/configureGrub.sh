#!/bin/bash

# Probe for the list of installed operating systems on the machine
# then update grub accordingly

# Update the grub configuration file at /boot/grub/grub.conf
configure_grub() {
	sudo os-prober
	sudo update-grub
}
