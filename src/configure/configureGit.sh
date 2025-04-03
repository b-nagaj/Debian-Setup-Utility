#!/bin/bash

# Configures a global git configuration file

# Constants
CONFIGURE="git config --global"
USERNAME="Falcon9659"
EMAIL="bryce.nagaj@proton.me"
EDITOR="subl"

# Customize global scope options
configure_git_global_options(){
	echo "Customizing global scope options for Git..."
	$CONFIGURE user.name $USERNAME
	$CONFIGURE user.email $EMAIL
	$CONFIGURE core.editor $EDITOR
	$CONFIGURE help.autocorrect true
	echo "Customized"
}
