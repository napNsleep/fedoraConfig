#!/bin/bash

FF_CONF="$HOME/.config/mozilla/firefox/*.default-release"

DNF_PACKAGES=(
	mesa-va-drivers-freeworld 
	gnome-tweaks 
	mullvad-vpn 
	steam 
	kitty 
	starship 
	hydrapaper
	piper
	flatseal 
	neovim 
	gnome-tweaks 
	gnome-shell-extension-forge
	gnome-shell-extension-appindicator
)

FLATPAK_PACKAGES=(
	flathub com.mattjakeman.ExtensionManager 
	com.discordapp.Discord 
	org.localsend.localsend_app	
)

# initialize firefox profile
timeout 5s firefox --headless

# firewall config
sudo firewall-cmd --set-default-zone=drop
sudo firewall-cmd --permanent --zone=drop --add-service=ssh \--add-service=dhcpv6-client \--add-service=samba-client
firewall-cmd --reload

# adding repos
flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo 
sudo dnf install https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm
sudo dnf copr enable @neurofedora/neurofedora-extra ; sudo dnf copr enable atim/starship
sudo dnf config-manager addrepo --from-repofile=https://repository.mullvad.net/rpm/stable/mullvad.repo

# swapping to full ffmpeg
sudo dnf swap ffmpeg-free ffmpeg --allowerasing -y

# install personal apps
sudo dnf install "${DNF_PACKAGES[@]}" --skip-broken --skip-unavailable -y
flatpak install "${FLATPAK_PACKAGES[@]}" -y

# copy files in right directories
cp ./.bashrc $HOME
cp -r ./.bin $HOME
cp -r ./firefox/chrome "$FF_CONF"
cp -r ./.config/* $HOME/.config
