#!/bin/sh

sudo pacman -S git feh redshit fzf emacs i3-wm i3lock i3config dmenu


mkdir ~/.i3
mkdir -p ~/Pictures/Wallpapers





cp kitty.conf ~/.config/kitty/
cp config ~/.i3/config
cp .bashrc ~/.bashrc
cp .bash_profile ~/.bash_profile
ln -sfT "$HOME/dev/dotfiles/gitconfig" "$HOME/.gitconfig"
git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch v0.7.2
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
curl -sSL https://get.haskellstack.org/ | sh
