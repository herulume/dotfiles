#!/bin/bash

sudo pacman -Syu
sudo pacman -S vim feh redshift fd emacs i3-wm i3lock dmenu i3status kitty otf-fira-code xorg-xinput arandr scrot cmake libtool ledger light

[ ! -d "~/.i3" ] && mkdir ~/.i3
[ ! -d "~/Pictures/Wallpapers/" ] && mkdir -p ~/Pictures/Wallpapers
[ ! -d "~/.config/kitty" ] && mkdir ~/.config/kitty/
[ ! -d "~/.emacs.d" ] && mkdir ~/.emacs.d

ln -sfT $HOME/dev/dotfiles/kitty.conf ~/.config/kitty/kitty.conf
ln -sfT $HOME/dev/dotfiles/config ~/.i3/config
ln -sfT $HOME/dev/dotfiles/bashrc ~/.bashrc
ln -sfT $HOME/dev/dotfiles/bash_profile ~/.bash_profile
ln -sfT $HOME/dev/dotfiles/gitconfig ~/.gitconfig

git submodule update --init
ln -sfT $HOME/dev/dotfiles/emacs.d/init.el ~/.emacs.d/init.el
ln -sfT $HOME/dev/dotfiles/emacs.d/config.org ~/.emacs.d/config.org

git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch v0.7.2

curl -sSL https://get.haskellstack.org/ | sh
