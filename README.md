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
    ```

3. Set up oh-my-zsh 
   1. Pre-install
        ```bash
        git clone https://github.com/zsh-users/zsh-syntax-highlighting ~/.dotfiles/oh-my-zsh/custom/plugins/zsh-syntax-highlighting
        git clone https://github.com/zsh-users/zsh-autosuggestions ~/.dotfiles/oh-my-zsh/custom/plugins/zsh-autosuggestions
        git clone https://github.com/zsh-users/zsh-completions ~/.dotfiles/oh-my-zsh/custom/plugins/zsh-completions
        ```
   2. Install
        ```bash
        ~/.dotfiles/oh-my-zsh/tools/install.sh
        ```
   3. Re-open terminal

4. zsh auto-completion
   - https://docs.brew.sh/Shell-Completion#configuring-completions-in-zsh

5. Homebrew
    ```bash
    brew bundle # Installs what's listed in Brewfile
    ```

### Manual Backups
obsidian
alfred
iterm2
