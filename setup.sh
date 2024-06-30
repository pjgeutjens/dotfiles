#!/bin/bash

cd ~
mkdir personal
mkdir work

# ugrade and base packages for install
sudo pacman -Syu base-devel git github-cli

git config --global user.email "pieter.geutjens@leapconsulting.be"
git config --global user.name "Pieter Jan Geutjens"

# install yay
mkdir tmp && cd tmp
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si

# install packages with yay
yay -Sy fzf stow alacritty bcompare lxappearance tmux neovim visual-studio-code-bin google-chrome-stable firefox acpi arandr archlinux-xdg-menu awesome-terminal-fonts dex dmenu dunst feh galculator gvfs gvfs-afc gvfs-gphoto2 gvfs-mtp gvfs-nfs gvfs-smb i3-wm i3blocks i3lock i3status jq lightdm lightdm-slick-greeter nwg-look mpv network-manager-applet numlockx playerctl polkit-gnome rofi scrot sysstat thunar thunar-archive-plugin thunar-volman tumbler unzip xarchiver xbindkeys xdg-user-dirs-gtk xed xfce4-terminal xorg-xbacklight xorg-xdpyinfo zip awesome-terminal-fonts ttf-jetbrains-mono-nerd i3blocks i3lock i3status rofi network-manager-applet bluez bluez-utils blueman noto-fonts prospect-mail --needed --noconfirm

# check if we are running from inside git repo (if so we assume it is the dotfiles repo)
inside_git_repo="$(git rev-parse --is-inside-work-tree 2>/dev/null)"
current_folder=$(basename "$PWD")

if ! [ "$inside_git_repo" ]; then
	cd ~
	git clone https://github.com/pjgeutjens/dotfiles.git && cd dotfiles
else
	echo "assuming to be running inside dotfiles repo"
fi

# make room for stowed config files
rm -rf ~/.bashrc
rm -rf ~/.config/Code
rm -rf ~/.config/dunst
rm -rf ~/.config/Thunar/
rm -rf ~/.config/alacritty/
rm -rf ~/.config/gh
rm -rf ~/.config/gtk*
rm -rf ~/.config/i3
rm -rf ~/.config/nwg-look/
rm -rf ~/.config/rofi
rm -rf ~/.config/tmux
rm -rf ~/.config/nvim
stow .

# sudo systemctl disable sddm
# sudo systemctl enable lightdm

#tmux tpm
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

# spotify
curl -sS https://download.spotify.com/debian/pubkey_6224F9941A8AA6D1.gpg | gpg --import -
yay -Sy spotify

# 1password
curl -sS https://downloads.1password.com/linux/keys/1password.asc | gpg --import
yay -Sy 1password

# nvm
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.7/install.sh | bash
source .bashrc
nvm install --lts
