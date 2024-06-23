sudo pacman -Syu base-devel git

git config --global user.email "pieter.geutjens@leapconsulting.be"
git config --global user.name "Pieter Jan Geutjens"

curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.7/install.sh | bashrc
source .bashrc
nvm install --lts

mkdir tmp && cd tmp

git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si

yay -S arandr alacritty thunar tmux neovim visual-studio-code-bin google-chrome-stable --needed
yay -S awesome-terminal-fonts
yay -S fzf stow
yay -S --needed i3blocks i3lock i3status rofi ttf-jetbrains-mono-nerd
yay -S --needed network-manager-applet
yay -S --needed thunar-archive-plugin unzip xarchiver zip feh
git clone https://github.com/pjgeutjens/dotfiles.git
rm -rf ~/.bashrc
rm -rf ~/.config/i3
cd dotfiles/
stow .
