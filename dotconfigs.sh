#!/usr/bin/env bash

# If any command fails this stops the script immediately
set -e

DOTFILES_DIR="$HOME/dotfiles"

echo "Cloning dotfiles"

if [ ! -d "$DOTFILES_DIR" ]; then
  git clone https://github.com/tamasmeidlinger/dotfiles.git "$DOTFILES_DIR"
else
  echo "Dotfiles already exist"
fi

mkdir -p "$HOME/.config"

echo "Copying sketchybar configs"
cp -r "$DOTFILES_DIR/sketchybar" "$HOME/.config"

chmod +x ~/.config/sketchybar/plugins/*
chmod +x ~/.config/sketchybar/items/*

# curl -L https://github.com/kvndrsslr/sketchybar-app-font/releases/download/v1.0.16/sketchybar-app-font.ttf -o $HOME/Library/Fonts/sketchybar-app-font.ttf
brew install --cask font-sketchybar-app-font

brew services start sketchybar

echo "Copying aerospace config"
cp "$DOTFILES_DIR/aerospace/.aerospace.toml" "$HOME"

echo "Copying nvim configs"
cp -r "$DOTFILES_DIR/nvim" "$HOME/.config"

echo "Copying phpactor configs"
cp -r "$DOTFILES_DIR/phpactor" "$HOME/.config"

mkdir -p "$HOME/.config/karabiner/assets/complex_modifications"

echo "Copying Karabiner Complex Modifications"
cp "$DOTFILES_DIR/karabiner-elements/complex_modifications/my-modifications.json" "$HOME/.config/karabiner/assets/complex_modifications"

echo "Copying Wezterm config"

cp "$DOTFILES_DIR/wezterm/.wezterm.lua" "$HOME"

echo "Making MacOS Dock faster"

defaults write com.apple.dock autohide-delay -float 0
defaults write com.apple.dock autohide-time-modifier -int 0
killall Dock

echo "Done!"
