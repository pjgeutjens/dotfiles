cd ~
mkdir personal
mkdir work

sudo pacman -Syu base-devel git github-cli

yay -Sy fzf stow

git config --global user.email "pieter.geutjens@leapconsulting.be"
git config --global user.name "Pieter Jan Geutjens"

mkdir tmp && cd tmp

git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si

yay -Sy alacritty tmux neovim visual-studio-code-bin google-chrome-stable --needed
yay -Sy acpi arandr archlinux-xdg-menu awesome-terminal-fonts dex dmenu dunst feh galculator gvfs gvfs-afc gvfs-gphoto2 gvfs-mtp gvfs-nfs gvfs-smb i3-wm i3blocks i3lock i3status jq lightdm lightdm-slick-greeter nwg-look mpv network-manager-applet numlockx playerctl polkit-gnome rofi scrot sysstat thunar thunar-archive-plugin thunar-volman tumbler unzip xarchiver xbindkeys xdg-user-dirs-gtk xed xfce4-terminal xorg-xbacklight xorg-xdpyinfo zip --needed
yay -Sy awesome-terminal-fonts ttf-jetbrains-mono-nerd
yay -Sy --needed i3blocks i3lock i3status rofi
yay -Sy network-manager-applet --needed

cd ~
git clone https://github.com/pjgeutjens/dotfiles.git && cd dotfiles
rm -rf ~/.bashrc
rm -rf ~/.config/Code
rm -rf ~/.config/Thunar/
rm -rf ~/.config/alacritty/
rm -rf ~/.config/gh
rm -rf ~/.config/gtk*
rm -rf ~/.config/i3
rm -rf ~/.config/rofi
rm -rf ~/.config/tmux
rm -rf ~/.config/nvim
cd dotfiles/
stow .

sudo systemctl disable sddm
sudo systemctl enable lightdm

curl -sS https://download.spotify.com/debian/pubkey_6224F9941A8AA6D1.gpg | gpg --import -
yay -Sy spotify

curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.7/install.sh | bashrc
source .bashrc
nvm install --lts
