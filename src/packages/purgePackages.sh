#!/bin/bash

# Purges a list of packages that come shipped with Debian 12 (Bookworm)
# GNU/Linux by default

# Constants
PURGE="sudo apt purge --autoremove"

# Associative Array
declare -A purgeList

# Adds a collection of key/value pairs to an associative array
initialize_purge_list() {
	purgeList+=(
		["FIREFOX"]="firefox-esr*"
		["GNOME_2048"]="gnome-2048/stable"
		["AISLERIOT_SOLITAIRE"]="aisleriot/stable"
		["GNOME_CALENDAR"]="gnome-calendar/stable"
		["GNOME_CHARACTERS"]="gnome-characters/stable"
		["GNOME_CHESS"]="gnome-chess/stable"
		["GNOME_CONTACTS"]="gnome-contacts/stable"
		["EVOLUTION"]="evolution evolution-exchange evolution-plugins evolution-common evolution-webcal"
		["FIVE_OR_MORE"]="five-or-more/stable"
		["FOUR_IN_A_ROW"]="four-in-a-row/stable"
		["GNOME_NIBBLES"]="gnome-nibbles/stable"
		["HITORI"]="hitori/stable"
		["GNOME_KLOTSKI"]="gnome-klotski/stable"
		["GNOME_MAHJONGG"]="gnome-mahjongg/stable"
		["GNOME_MAPS"]="gnome-maps/stable"
		["GNOME_MINES"]="gnome-mines/stable"
		["GNOME_MUSIC"]="gnome-music/stable"
		["QUADRAPASSEL"]="quadrapassel/stable"
		["RHYTHMBOX"]="rhythmbox*"
		["ROBOTS"]="gnome-robots/stable"
		["GNOME_SOUND_RECORDER"]="gnome-sound-recorder/stable"
		["GNOME_SUDOKU"]="gnome-sudoku/stable"
		["SWELL_FOOP"]="swell-foop/stable"
		["TALI"]="tali/stable"
		["GNOME_TAQUIN"]="gnome-taquin/stable"
		["GNOME_TETRAVEX"]="gnome-tetravex/stable"
		["GNOME_WEATHER"]="gnome-weather/stable"
	)
}

# Purges a list of packages and removes their configuration files
purge() {
	echo "Purging applications..."
	initialize_purge_list
	for key in "${!purgeList[@]}"
	do
	    $PURGE "${purgeList[$key]}" -y
	done
	
	# Re-install gnome-panel, since purging evolution uninstalls it
	sudo apt install gnome-panel
	
	echo "Purged"
}
