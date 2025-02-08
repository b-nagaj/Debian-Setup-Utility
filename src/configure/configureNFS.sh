#!/bin/bash

# Establishes a connection to a local Network File Server (NFS)

# Constants
MOUNT_POINT="/home/bryce/Sync"
HOST="192.168.50.190"
NFS_SHARE_DIRECTORY=$MOUNT_POINT

# Create a mount point
create_nfs_mount_point() {
	echo "Creating a mount point for a local NFS at $MOUNT_POINT"
	mkdir $MOUNT_POINT
	echo "Directory created"
}

# Mount the NFS
mount_nfs() {
	echo "Establishing a connection with a local NFS..."
	sudo mount $HOST:$NFS_SHARE_DIRECTORY
	echo "Connection established"
}
