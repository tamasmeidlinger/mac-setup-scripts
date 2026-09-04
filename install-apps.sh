#!/usr/bin/env bash

# This is how execute it
# bash <(curl -s https://raw.githubusercontent.com/tamasmeidlinger/mac-setup-scripts/main/print-hello.sh)
set -e

echo "Downloading Homebrew"
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

echo "Adding Homebrew to PATH"
echo >>"$HOME/.zprofile"
echo 'eval "$(/opt/homebrew/bin/brew shellenv zsh)"' >>"$HOME/.zprofile"
eval "$(/opt/homebrew/bin/brew shellenv zsh)"
brew --version

echo "Installing apps and packages"
brew install --cask \
  lulu zen \
  obs visual-studio-code \
  karabiner-elements betterdisplay \
  mac-mouse-fix zoom vb-cable shottr \
  aldente wezterm \
  insomnia joplin nikitabobko/tap/aerospace \
  font-caskaydia-mono-nerd-font

brew install \
  python git uv pnpm node \
  tldr eza bat fd ripgrep fzf \
  lazygit neovim tree-sitter

brew tap FelixKratz/formulae
brew install sketchybar

echo "Done"
echo "Open Lulu and Karabiner before continuing"
