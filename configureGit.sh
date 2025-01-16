#!/bin/bash

# Configures a global git configuration file

# Constants
USERNAME = "b-nagaj"
EMAIL = "bryce.nagaj@proton.me"
EDITOR = "subl"

# Customize global scope options
set_global_options(){
	git config --global user.name $USERNAME
	git config --global user.email $EMAIL
	git config --global core.editor $EDITOR
	git config --global help.autocorrect true
}

main() {
	echo "Customizing global scope options for Git..."
	set_global_options
	echo "Customized"
}
