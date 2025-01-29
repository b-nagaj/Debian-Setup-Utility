#!/bin/bash

# Configures a global git configuration file

# Constants
USERNAME = "b-nagaj"
EMAIL = "bryce.nagaj@proton.me"
EDITOR = "subl"

# Customize global scope options
configure_git_global_options(){
	echo "Customizing global scope options for Git..."
	git config --global user.name $USERNAME
	git config --global user.email $EMAIL
	git config --global core.editor $EDITOR
	git config --global help.autocorrect true
	echo "Customized"
}
