#!/usr/bin/env fish

# Exit on error
set -e

echo "This file should only run once..."
echo "Starting dotfiles bootstrap process..."

# 1. Install Fish packages (via Fisher)
echo "Installing Fisher and plugins..."
curl -sL https://raw.githubusercontent.com/jorgebucaran/fisher/main/functions/fisher.fish | source && fisher install jorgebucaran/fisher
fisher install jorgebucaran/nvm.fish
fisher install IlanCosman/tide@v6

# 2. Set Universal Variables
echo "Setting universal variables..."
set -U nvm_default_version 24.20.0
# Add any other -U variables here (e.g., tide configuration wizard bypasses if you use them)

# 4. Symlink Configuration Files
echo "Symlinking configs..."
ln -sf ~/dotfiles/fish/config.fish ~/.config/fish/config.fish

echo "Bootstrap complete. Run 'exec fish'"
