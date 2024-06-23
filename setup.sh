cd ~
mkdir personal
mkdir work

sudo pacman -Syu base-devel git github-cli

yay -Sy fzf stow

git config --global user.email "pieter.geutjens@leapconsulting.be"
git config --global user.name "Pieter Jan Geutjens"

curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.7/install.sh | bashrc
source .bashrc
nvm install --lts

mkdir tmp && cd tmp

git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si

yay -Sy arandr thunar --needed
yay -Sy alacritty tmux neovim visual-studio-code-bin google-chrome-stable --needed
yay -Sy awesome-terminal-fonts ttf-jetbrains-mono-nerd
yay -Sy --needed i3blocks i3lock i3status rofi
yay -Sy --needed network-manager-applet
yay -Sy --needed thunar-archive-plugin unzip xarchiver zip feh

curl -sS https://download.spotify.com/debian/pubkey_6224F9941A8AA6D1.gpg | gpg --import -
yay -Sy spotify

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
