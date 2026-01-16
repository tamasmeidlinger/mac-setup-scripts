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

echo "Copying aerospace config"
cp "$DOTFILES_DIR/aerospace/.aerospace.toml" "$HOME"

echo "Copying nvim configs"
cp -r "$DOTFILES_DIR/nvim" "$HOME/.config"

echo "Copying phpactor configs"
cp -r "$DOTFILES_DIR/phpactor" "$HOME/.config"

mkdir -p "$HOME/.config/karabiner/assets/complex_modifications"

echo "Copying Karabiner Complex Modifications"
cp "$DOTFILES_DIR/karabiner-elements/complex_modifications/"* "$HOME/.config/karabiner/assets/complex_modifications"

echo "Done!"
