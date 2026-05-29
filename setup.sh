# adding repos
flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo 

sudo dnf install https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm

sudo dnf copr enable @neurofedora/neurofedora-extra 

sudo dnf copr enable atim/starship

sudo dnf config-manager addrepo --from-repofile=https://repository.mullvad.net/rpm/stable/mullvad.repo

# swapping to full ffmpeg
sudo dnf swap ffmpeg-free ffmpeg --allowerasing -y

# install personal apps
sudo dnf install mesa-va-drivers-freeworld gnome-tweaks mullvad-vpn steam kitty starship hydrapaper piper flatseal neovim -y

flatpak install flathub com.mattjakeman.ExtensionManager com.discordapp.Discord org.localsend.localsend_app -y

