#!/bin/bash

# maximize dnf dl speed
echo -e 'max_parallel_downloads=20\ndefaultyes=true' | sudo tee -a /etc/dnf/dnf.conf

# disable wait for network start before boot
systemctl disable systemd-networkd-wait-online.service

# system upgrade
sudo dnf upgrade --refresh -y

# remove default apps
packages=(
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

sudo dnf remove "${packages[@]}" -y

sleep 5

# restart
sudo systemctl reboot
