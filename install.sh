#!/bin/sh

sudo pacman -Syu
sudo pacman -S vim feh redshift fd emacs i3-wm i3lock dmenu i3status kitty otf-fira-code xorg-xinput arandr scrot cmake libtool ledger

mkdir ~/.i3
mkdir -p ~/Pictures/Wallpapers
mkdir ~/.config/kitty/

ln -sfT $HOME/dev/dotfiles/kitty.conf ~/.config/kitty/
ln -sfT $HOME/dev/dotfiles/config ~/.i3/config
ln -sfT $HOME/dev/dotfiles/bashrc ~/.bashrc
ln -sfT $HOME/dev/dotfiles/bash_profile ~/.bash_profile
ln -sfT $HOME/dev/dotfiles/gitconfig ~/.gitconfig

git submodule update --init
ln -sfT $HOME/dev/dotfiles/emacs.d ~/.emacs.d/

git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch v0.7.2

curl -sSL https://get.haskellstack.org/ | sh
