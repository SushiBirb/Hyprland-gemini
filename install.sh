#!/usr/bin/env bash

# Hogwarts Rice Automated Installer

set -e

echo "Starting automated installation for Hogwarts Rice..."

# 1. Install Dependencies
echo "Installing dependencies..."
sudo pacman -S --noconfirm git rofi kitty dolphin jq wlr-randr

# 2. Run Illogical Impulse Setup
echo "Running Illogical Impulse core setup..."
cd "$(dirname "$0")"
chmod +x setup
./setup install

# 3. Apply Hogwarts Assets
echo "Applying Hogwarts assets..."
mkdir -p $HOME/hogwarts-rice/wallpapers
mkdir -p $HOME/.local/bin
mkdir -p $HOME/.config/wlogout/icons

# Note: The actual wallpapers and scripts should be bundled with the repo,
# so we will copy them from this repo to their destinations.
cp -r assets/wallpapers/* $HOME/hogwarts-rice/wallpapers/ 2>/dev/null || true
cp scripts/hogwarts-theme $HOME/.local/bin/ 2>/dev/null || true
cp scripts/hogwarts-settings $HOME/.local/bin/ 2>/dev/null || true
cp scripts/hogwarts-rofi $HOME/.local/bin/ 2>/dev/null || true

chmod +x $HOME/.local/bin/hogwarts-*

# 4. Enforce Resolution
wlr-randr --output Virtual-1 --mode 1920x1080@60 || true

echo "Installation complete! Reload Hyprland or run hogwarts-settings to apply themes."
