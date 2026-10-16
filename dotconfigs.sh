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

# Sketchybar setup
mkdir -p "$HOME/.config/sketchybar"
echo "Copying sketchybar configs"
cp -r "$DOTFILES_DIR/sketchybar/"* "$HOME/.config/sketchybar/"

chmod +x ~/.config/sketchybar/plugins/*
chmod +x ~/.config/sketchybar/items/*

# curl -L https://github.com/kvndrsslr/sketchybar-app-font/releases/download/v1.0.16/sketchybar-app-font.ttf -o $HOME/Library/Fonts/sketchybar-app-font.ttf
brew install --cask font-sketchybar-app-font

brew services start sketchybar

# Aerospace setup
echo "Copying aerospace config"
cp "$DOTFILES_DIR/aerospace/.aerospace.toml" "$HOME"

# Neovim setup
echo "Copying nvim configs"
cp -r "$DOTFILES_DIR/nvim" "$HOME/.config"

# Karabiner setup
mkdir -p "$HOME/.config/karabiner/assets/complex_modifications"

echo "Copying Karabiner Complex Modifications"
cp "$DOTFILES_DIR/karabiner-elements/complex_modifications/my-modifications.json" "$HOME/.config/karabiner/assets/complex_modifications"

# Wezterm setup
echo "Copying Wezterm config"
cp "$DOTFILES_DIR/wezterm/.wezterm.lua" "$HOME"

# VSCode setup
echo "Copying VSCode CSS"
mkdir -p "$HOME/.config/vscode-custom"
cp "$DOTFILES_DIR/vscode-settings/vscode-styles.css" "$HOME/.config/vscode-custom/"

# zshrc setup
echo "Setting up .zshrc"
cat "$DOTFILES_DIR/zsh/.zshrc" >"$HOME/.zshrc"

# Make MacOS Dock faster
echo "Making MacOS Dock faster"

defaults write com.apple.dock autohide-delay -float 0
defaults write com.apple.dock autohide-time-modifier -int 0
killall Dock

echo "IMPORTANT!"
echo "tsx is not yet installed."
echo "If you want to install it run:"
echo "pnpm add -g tsx"
echo "pnpm may not have a global executable directory configured yet"
echo "in that case run:"
echo "pnpm setup"
