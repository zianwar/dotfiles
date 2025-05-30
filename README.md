# dotfiles

Personal [dotfiles](https://www.quora.com/What-are-dotfiles) and command line configs.

Includes:

- [tmux](https://github.com/gpakosz/.tmux)
- [oh-my-zsh](https://github.com/ohmyzsh/ohmyzsh)
- shell functions & aliases
- brew formulas
- git configs

## Install

1. Install Homebrew
   https://brew.sh/
2. Clone this repo

   ```bash
   git clone git@github.com:zianwar/dotfiles.git ~/.dotfiles

   cd ~/.dotfiles && git submodule update --init
   make

   ./setup.sh
   ```

3. zsh auto-completion

   - https://docs.brew.sh/Shell-Completion#configuring-completions-in-zsh

4. Homebrew
   ```bash
   brew bundle # Installs what's listed in Brewfile
   ```

### Apps I use not listed in [Brewfile](./Brewfile)

### Manual Backups (TODO)

- Obsidian
- Alfred
- iTerm2
