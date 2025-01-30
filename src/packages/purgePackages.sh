#!/bin/bash

# Purges a list of packages that come shipped with Debian 12 (Bookworm)
# GNU/Linux by default

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
		["EVOLUTION"]="evolution-data-server-common/stable evolution-data-server/stable"
		["FIVE_OR_MORE"]="five-or-more/stable"
		["FOUR_IN_A_ROW"]="four-in-a-row/stable"
		["GNOME_NIBBLES"]="gnome-nibbles/stable"
		["HITORI"]="hitori/stable"
		["GNOME_KLOTSKI"]="gnome-klotski/stable"
		["GNOME_MAHJONGG"]="gnome-mahjongg/stable"
		["GNOME_MAPS"]="gnome-maps/stable"
		["GNOME_MINES"]="gnome-mines/stable"
		["GNOME_MUSIC"]="gnome-maps/stable"
		["QUADRAPASSEL"]="quadrapassel/stable"
		["RYTHMBOX"]="librhythmbox-core10/stable rhythmbox-data/stable rhythmbox-plugin-cdrecorder/stable rhythmbox-plugins/stable rhythmbox/stable"
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
	initialize_purge_list

	echo "Purging applications..."

	for key in "${!purgeList[@]}"
	do
		sudo apt purge --autoremove "${purgeList[$key]}" -y
	done

	echo "Purged"
}
