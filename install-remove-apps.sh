#!/usr/bin/env bash

set -e

echo "Downloading Homebrew"
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

brew --version

echo "Installing apps and packages"
brew install --cask \
  lulu zen vivaldi \
  obs visual-studio-code \
  karabiner-elements betterdisplay \
  mac-mouse-fix zoom vb-cable shottr \
  malwarebytes aldente \
  wezterm libreoffice \
  insomnia joplin aerospace \
  font-caskaydia-mono-nerd-font

brew install \
  python git uv pnpm node \
  tldr eza bat fd ripgrep fzf \
  lazygit neovim tree-sitter \
  postgresql sketchybar php@8.4 composer

echo "Done"
echo "Now set git up"
