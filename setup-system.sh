#!/bin/bash

# checks if the script is run with sudo
if [[ $EUID -ne 0 ]]; then
	echo "script requires sudo: sudo $0"
	exit 1
fi

# maximize dnf dl speed
echo -e 'max_parallel_downloads=20\ndefaultyes=true' | tee -a /etc/dnf/dnf.conf > /dev/null

# adding repos
dnf install https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm -y
dnf copr enable @neurofedora/neurofedora-extra -y
dnf copr enable atim/starship
dnf config-manager addrepo --from-repofile=https://repository.mullvad.net/rpm/stable/mullvad.repo

# system upgrade
dnf upgrade --refresh -y

sleep 5

# remove default apps
BLOAT=(
    gnome-contacts 
    gnome-weather 
    gnome-clocks 
    gnome-maps 
    simple-scan 
    gnome-boxes 
    showtime 
    snapshot 
    gnome-characters 
    decibels 
    gnome-connections 
    papers 
    baobab 
    malcontent-control 
    gnome-tour 
    gnome-calendar 
    gnome-shell-extension-common
    gnome-shell-extension-background-logo
)

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
	dconf-editor
)

dnf swap ffmpeg-free ffmpeg --allowerasing -y
dnf remove "${BLOAT[@]}" -y
dnf install "${DNF_PACKAGES[@]}" --skip-broken --skip-unavailable -y

# firewall config
firewall-cmd --set-default-zone=drop > /dev/null
firewall-cmd --permanent --zone=drop --add-service=ssh \--add-service=dhcpv6-client > /dev/null
firewall-cmd --reload > /dev/null

# disable wait for network start before boot
systemctl disable systemd-networkd-wait-online.service

sleep 5

# restart
systemctl reboot


