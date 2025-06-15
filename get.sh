#!/bin/bash

# ================================================================
# This script clones the dotfiles repository and runs the setup script.
# It is intended to be run on a fresh system using curl:
# curl -sSL https://anw.sh/get-dotfiles.sh | bash
# ================================================================

set -e

echo "Cloning dotfiles into ~/.dotfiles..."

# Clone if not already there
if [ ! -d "$HOME/.dotfiles" ]; then
    git clone https://github.com/zianwar/dotfiles.git "$HOME/.dotfiles"
else
    echo "Dotfiles already exist in ~/.dotfiles. Exiting."
    exit 1
fi

cd "$HOME/.dotfiles"
echo "Cloning submodules..."
git submodule update --init

# Make main setup script executable
chmod +x setup.sh

# Run main dotfiles setup script
./setup.sh clean
./setup.sh install
./setup.sh sync
./setup.sh install-packages
