#!/bin/bash

# Establishes a connection to a local Network File Server (NFS)

# Constants
MOUNT_POINT = "/home/bryce/Sync"
HOST = 192.168.50.190
NFS_SHARE_DIRECTORY = $MOUNT_POINT

# Create a mount point
create_mount() {
	mkdir $MOUNT_POINT
}

# Mount the NFS
mount() {
	sudo mount $HOST:$NFS_SHARE_DIRECTORY
}

# Entry point
main() {
	echo "Establishing a connection with a local NFS..."
	create_mount()
	mount()
	echo "Connection established"
}

main
