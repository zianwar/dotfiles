#!/usr/bin/env sh

# Install command-line tools using Homebrew.

# Make sure we’re using the latest Homebrew.
brew update

# Upgrade any already-installed formulae.
brew upgrade

# Save Homebrew’s installed location.
BREW_PREFIX=$(brew --prefix)

# Install GNU core utilities (those that come with macOS are outdated).
# Don’t forget to add `$(brew --prefix coreutils)/libexec/gnubin` to `$PATH`.
brew install coreutils
ln -s "${BREW_PREFIX}/bin/gsha256sum" "${BREW_PREFIX}/bin/sha256sum"

# Install some other useful utilities like `sponge`.
brew install moreutils
# Install GNU `find`, `locate`, `updatedb`, and `xargs`, `g`-prefixed.
brew install findutils
# Install GNU `sed`, overwriting the built-in `sed`.
brew install gnu-sed --with-default-names
# Install a modern version of Bash.
brew install bash
brew install bash-completion2

# Switch to using brew-installed bash as default shell
if ! fgrep -q "${BREW_PREFIX}/bin/bash" /etc/shells; then
  echo "${BREW_PREFIX}/bin/bash" | sudo tee -a /etc/shells;
  chsh -s "${BREW_PREFIX}/bin/bash";
fi;

# Install `wget` with IRI support.
brew install wget --with-iri

# Install GnuPG to enable PGP-signing commits.
brew install gnupg

# Install more recent versions of some macOS tools.
brew install vim --with-override-system-vi
brew install grep
brew install openssh
brew install openssl
brew install telnet
brew install php
brew install gmp
brew install tmux
brew install ssh-copy-id

# tmux utils
brew install tmux-mem-cpu-load
brew install reattach-to-user-namespace

# Install font tools.
brew tap bramstein/webfonttools
brew install sfnt2woff
brew install sfnt2woff-zopfli
brew install woff2

# Install other useful binaries.
brew install git
brew install git-lfs
brew install shellcheck
brew install python@3
brew install node
brew install nvm # Manage multiple Node.js versions
brew install ruby
brew install rbenv # Ruby version manager
brew install ack # Search tool like grep, but optimized for programmers
brew install imagemagick --with-webp
brew install tree # Display directories as trees (with optional color/HTML output)
brew install rsync # Utility that provides fast incremental file transfer
brew install insect # used for alfred's `clc` workflow.
brew install m-cli # Swiss Army Knife for macOS
brew install mysql
brew install protobuf # Protocol buffers (Google's data interchange format)
brew install httpie # User-friendly cURL replacement (command-line HTTP client)
brew install youtube-dl # Download YouTube videos from the command-line
brew install exercism
brew install aspell # Spell checker with better logic than ispell
brew install nginx
brew install watch # Executes a program periodically, showing output fullscreen
brew install fswatch # Monitor a directory for changes and run a shell command
brew install redis
brew install trash # CLI tool that moves files or folder to the trash
brew install nmap # Port scanning utility for large networks
brew install sqlite # Command-line interface for SQLite
brew install htop # Improved top (interactive process viewer)
brew install ffmpeg # Play, record, convert, and stream audio and video
brew install wifi-password # Show the current WiFi network password
brew install exiftool # Perl lib for reading and writing EXIF metadata
brew install mkcert # Simple tool to make locally trusted development certificates
brew install mitmproxy # Intercept, modify, replay, save HTTP/S traffic
brew install hugo # Configurable static site generator
brew install go # Go programming language
brew install dep # Go dependency management tool
brew install yarn # JavaScript package manager
brew install mongodb-community # High-performance, schema-free, document-oriented database
brew install jq # Lightweight and flexible command-line JSON processor

# Remove outdated versions from the cellar.
brew cleanup
