#!/bin/bash
set -e

# Ensure script is run from ~/.dotfiles
if [[ "$PWD" != "$HOME/.dotfiles" ]]; then
  echo "Error: This script must be run from the ~/.dotfiles directory."
  exit 1
fi

# Define packages to be installed for ubuntu here, for macOS they are listed in ./Brewfile
UBUNTU_PACKAGES=(zsh fzf eza)

sync() {
  [ -f ~/.environment ] || ln -fs "$PWD/.environment" ~/.environment
  [ -f ~/.zshrc ] || ln -fs "$PWD/.zshrc" ~/.zshrc
  [ -f ~/.aliases ] || ln -fs "$PWD/.aliases" ~/.aliases
  [ -f ~/.exports ] || ln -fs "$PWD/.exports" ~/.exports
  [ -f ~/.functions ] || ln -fs "$PWD/.functions" ~/.functions
  [ -f ~/.tmux.conf ] || ln -fs "$PWD/.tmux.conf" ~/.tmux.conf
  [ -f ~/.gitconfig ] || ln -fs "$PWD/.gitconfig" ~/.gitconfig
  [ -f ~/.gitignore_global ] || ln -fs "$PWD/.gitignore_global" ~/.gitignore_global
  [ -f ~/.ripgreprc ] || ln -fs "$PWD/.ripgreprc" ~/.ripgreprc

  touch ~/.hushlogin
}

clean() {
  force=0
  for arg in "$@"; do
    if [[ "$arg" == "--force" ]]; then
      force=1
    fi
  done

  if [[ $force -eq 0 ]]; then
    echo "Are you sure you want to remove all linked dotfiles from your home directory? [y/N]"
    read -r confirm
    if [[ ! "$confirm" =~ ^[Yy]$ ]]; then
      echo "Aborted."
      return
    fi
  fi

  rm -f ~/.environment
  rm -f ~/.zshrc
  rm -f ~/.aliases
  rm -f ~/.exports
  rm -f ~/.functions
  rm -f ~/.tmux.conf
  rm -f ~/.gitconfig
  rm -f ~/.gitignore_global
  rm -f ~/.ripgreprc
  echo "Cleanup complete."
}

install_packages() {
  echo "Installing packages..."

  if [[ "$OSTYPE" == "linux-gnu"* ]]; then
    echo "Running on Linux OS. Installing packages using apt..."
    sudo apt update && sudo apt upgrade -y && sudo apt autoremove -y
    sudo apt install -y "${UBUNTU_PACKAGES[@]}"
  elif [[ "$OSTYPE" == "darwin"* ]]; then
    echo "Running on macOS. Installing packages using Homebrew..."
    if ! command -v brew >/dev/null; then
      echo "Homebrew not found. Installing Homebrew..."
      /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
      eval "$(/opt/homebrew/bin/brew shellenv)"
    fi
    # Install packages listed in Brewfile
    brew bundle
  else
    echo "Unsupported OS: $OSTYPE"
    exit 1
  fi
}

install_zsh_plugins() {
  ZSH_CUSTOM="${ZSH_CUSTOM:-$HOME/.dotfiles/oh-my-zsh/custom}"

  git clone https://github.com/zsh-users/zsh-syntax-highlighting "$ZSH_CUSTOM/plugins/zsh-syntax-highlighting"
  git clone https://github.com/zsh-users/zsh-autosuggestions "$ZSH_CUSTOM/plugins/zsh-autosuggestions"
  git clone https://github.com/zsh-users/zsh-completions "$ZSH_CUSTOM/plugins/zsh-completions"
  git clone https://github.com/Aloxaf/fzf-tab "$ZSH_CUSTOM/plugins/fzf-tab"
}
case "$1" in
sync)
  sync
  ;;
clean)
  clean
  ;;
install)
  install_zsh_plugins
  ;;
install-packages)
  install_packages
  ;;
*)
  echo "Usage: $0 {sync|clean|install_zsh_plugins|install_packages}"
  exit 1
  ;;
esac
