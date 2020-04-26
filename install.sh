#!/bin/sh

sudo pacman -Syu
sudo pacman -S neovim feh dmenu i3status otf-fira-code xorg-xinput arandr cmake libtool tmux xorg-xbacklight slock fzf kitty mpv brave

# Dev
[ ! -d "$HOME/dev" ] && mkdir "$HOME/dev"

# My runes
[ ! -d "$HOME/.local/bin" ] && mkdir "$HOME/.local/bin"
cp "./runes/"* "$HOME/.local/bin"
chmod +x "$HOME/.local/bin/"*

# Where to save wallpapers
[ ! -d "$HOME/Pictures/Wallpapers/" ]     && mkdir -p "$HOME/Pictures/Wallpapers"
cp "./wallpaper.jpg" "$HOME/Pictures/Wallpapers/"

# Kitty config
[ ! -d "$HOME/.config/kitty/" ]           && mkdir -p "$HOME/.config/kitty"
ln -sfT "$HOME/dev/dotfiles/kitty.conf"               "$HOME/.config/kitty/kitty.conf"

# Bash and tmux
ln -sfT "$HOME/dev/dotfiles/bashrc"                   "$HOME/.bashrc"
ln -sfT "$HOME/dev/dotfiles/bash_profile"             "$HOME/.bash_profile"
ln -sfT "$HOME/dev/dotfiles/tmux.conf"                "$HOME/.tmux.conf"

# Git
ln -sfT "$HOME/dev/dotfiles/gitconfig"                "$HOME/.gitconfig"

# Neovim
ln -sfT "$HOME/dev/dotfiles/nvim/init.vim"                 "$HOME/.config/nvim/init.vim"
ln -sfT "$HOME/dev/dotfiles/nvim/coc-settings.json"        "$HOME/.config/nvim/coc-settings.json"

# asdf
[ ! -d "$HOME/.asdf" ] && git clone https://github.com/asdf-vm/asdf.git "$HOME/.asdf" --branch v0.7.2

# Haskell stack
curl -sSL https://get.haskellstack.org/ | sh

# Aura
cd "$HOME/dev/"
git clone https://github.com/fosskers/aura.git
cd -
cd "$HOME/dev/aura"
stack install -- aura
cd -

ln -sfT "$HOME/dev/dotfiles/xsession"                 "$HOME/.xsession"
