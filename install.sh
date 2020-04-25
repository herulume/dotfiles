#!/bin/sh

sudo pacman -Syu
sudo pacman -S neovim feh dmenu i3status otf-fira-code xorg-xinput arandr cmake libtool ledger tmux xorg-xbacklight pulsemixer slock yay fzf kitty mpv ctags

sudo cp battery /usr/local/bin
sudo chmod +x /usr/local/bin/battery

[ ! -d "$HOME/.local/bin" ] && mkdir "$HOME/.local/bin"
cp ./runes/* "$HOME/.local/bin"
chmod +x "$HOME/.local/bin/"*

[ ! -d "$HOME/Pictures/Wallpapers/" ]     && mkdir -p "$HOME/Pictures/Wallpapers"
[ ! -d "$HOME/.config/nvim/my_snippets" ] && mkdir -p "$HOME/.config/nvim/my_snippets"
[ ! -d "$HOME/.config/kitty/" ]           && mkdir -p "$HOME/.config/kitty"

ln -sfT "$HOME/dev/dotfiles/kitty.conf"               "$HOME/.config/kitty/kitty.conf"
ln -sfT "$HOME/dev/dotfiles/bashrc"                   "$HOME/.bashrc"
ln -sfT "$HOME/dev/dotfiles/bash_profile"             "$HOME/.bash_profile"
ln -sfT "$HOME/dev/dotfiles/gitconfig"                "$HOME/.gitconfig"
#ln -sfT "$HOME/dev/dotfiles/xsession"                 "$HOME/.xsession"
ln -sfT "$HOME/dev/dotfiles/nvim/init.vim"                 "$HOME/.config/nvim/init.vim"
ln -sfT "$HOME/dev/dotfiles/nvim/coc-settings.json"        "$HOME/.config/nvim/coc-settings.json"
ln -sfT "$HOME/dev/dotfiles/tmux.conf"                "$HOME/.tmux.conf"

[ ! -d "$HOME/.asdf" ] && git clone https://github.com/asdf-vm/asdf.git "$HOME/.asdf" --branch v0.7.2
