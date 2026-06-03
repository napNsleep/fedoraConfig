#!/bin/bash

set_keys() {
	local slot="$1"
	local name="$2"
	local command="$3"
	local binding="$4"

	local path="/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/$slot/"

	gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:"$path" name "$name"
	gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:"$path" command "$command"
	gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:"$path" binding "$binding"
}


gsettings set org.gnome.settings-daemon.plugins.media-keys control-center "['<Super>Return']"
gsettings set org.gnome.settings-daemon.plugins.media-keys mic-mute "['F12']"
gsettings set org.gnome.shell.keybindings toggle-message-tray "['']"
gsettings set org.gnome.shell.keybindings toggle-quick-settings "['']"
gsettings set org.gnome.desktop.wm.keybindings switch-group "['']"

set_keys custom0 "Open Firefox" "firefox" "<Super>w"
set_keys custom1 "Open Kitty" "kitty" "<Super>grave>"
set_keys custom2 "Open Files" "nautilus" "<Super>f"
set_keys custom3 "Open Discord" "flatpak run com.discordapp.Discord" "<Super>d"
set_keys custom4 "Toggle Mullvad" "toggleMullvad" "<Control><Alt>v"
set_keys custom5 "Open Mullvad" "/opt/Mullvad VPN/mullvad-vpn" "<Super>m"
set_keys custom6 "Open Steam" "steam" "<Super>s"

gsettings set org.gnome.settings-daemon.plugins.media-keys custom-keybindings \
"['/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/',
'/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom1/',
'/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom2/',
'/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom3/',
'/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom4/',
'/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom5/',
'/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom6/']"


