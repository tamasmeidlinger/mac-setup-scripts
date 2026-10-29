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
  font-caskaydia-mono-nerd-font look

brew install \
  bat btop eza fd ripgrep fzf yazi \
  zoxide git lazygit neovim \
  python uv node pnpm \
  leaf-markdown-viewer typescript sqlite \
  bookokrat jq powerlevel10k

brew tap FelixKratz/formulae
brew install sketchybar

# TODO-APP
mkdir -p "$HOME/tools"

git clone https://github.com/tamasmeidlinger/to-do-tui.git "$HOME/tools/to-do/"

uv sync --project "$HOME/tools/to-do"

cp "$HOME/tools/to-do/data/backup-to-do.json" "$HOME/tools/to-do/data/to-do.json"

cp "$HOME/tools/to-do/data/backup-weekly-tasks.json" "$HOME/tools/to-do/data/weekly-tasks.json"

cp "$HOME/tools/to-do/data/backup-todo-on-day-x.json" "$HOME/tools/to-do/data/todo-on-day-x.json"

# THEME-SWITCHER

git clone https://github.com/tamasmeidlinger/theme-switcher-macos.git "$HOME/tools/theme-switcher"

echo "Done"
echo "Open Lulu and Karabiner before continuing"
