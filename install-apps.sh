#!/usr/bin/env bash

# This is how execute it
# bash <(curl -s https://raw.githubusercontent.com/tamasmeidlinger/mac-setup-scripts/main/print-hello.sh)
set -e

# Homebrew setup
echo "Downloading Homebrew"
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

echo "Adding Homebrew to PATH"
echo >>"$HOME/.zprofile"
echo 'eval "$(/opt/homebrew/bin/brew shellenv zsh)"' >>"$HOME/.zprofile"
eval "$(/opt/homebrew/bin/brew shellenv zsh)"
brew --version

# Install apps and packages
echo "Installing apps and packages"
brew install --cask \
  lulu karabiner-elements nikitabobko/tap/aerospace \
  aldente betterdisplay mac-mouse-fix \
  shottr obs zoom vb-cable \
  wezterm visual-studio-code docker-desktop \
  dbeaver-community quarto typst \
  zen firefox joplin discord \
  font-caskaydia-mono-nerd-font

brew install \
  bat btop eza fd ripgrep fzf yazi \
  zoxide git lazygit neovim \
  python uv node pnpm \
  leaf-markdown-viewer typescript sqlite \
  bookokrat jq

brew tap FelixKratz/formulae
brew install sketchybar

echo "Done"
echo "Open Lulu and Karabiner before continuing"
