#!/bin/sh

sudo pacman -S git feh redshift fzf emacs i3-wm i3lock dmenu 3status kitty otf-fira-code


mkdir ~/.i3
mkdir -p ~/Pictures/Wallpapers
mkdir ~/.config/kitty/




cp kitty.conf ~/.config/kitty/
cp config ~/.i3/config
cp .bashrc ~/.bashrc
cp .bash_profile ~/.bash_profile
ln -sfT "$HOME/dev/dotfiles/gitconfig" "$HOME/.gitconfig"
git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch v0.7.2
curl -sSL https://get.haskellstack.org/ | sh
