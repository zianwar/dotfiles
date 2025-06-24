#!/bin/bash

# ================================================================
# This script clones the dotfiles repository and runs the setup script.
# It is intended to be run on a fresh system using curl:
# curl -sSL https://pub.anw.sh/get-dotfiles.sh | bash
# ================================================================

set -e

run_cmd() {
    echo "+ $*"
    "$@"
    echo ""
}

echo "Cloning dotfiles into ~/.dotfiles..."

# Clone if not already there
if [ ! -d "$HOME/.dotfiles" ]; then
    run_cmd git clone git@github.com:zianwar/dotfiles.git "$HOME/.dotfiles"
else
    echo "Dotfiles already exist in ~/.dotfiles. Exiting."
    # exit 1
fi

run_cmd cd "$HOME/.dotfiles"
echo "Cloning submodules..."
run_cmd git submodule update --init

# Make main setup script executable
run_cmd chmod +x setup.sh

# Run main dotfiles setup script
run_cmd ./setup.sh clean --force
run_cmd ./setup.sh install
run_cmd ./setup.sh sync
run_cmd ./setup.sh install-packages

# Set zsh as the default shell if not already
if [ "$SHELL" != "/bin/zsh" ]; then
    echo "Setting zsh as default shell..."
    chsh -s /bin/zsh
fi
