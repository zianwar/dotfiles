# dotfiles

Personal [dotfiles](https://www.quora.com/What-are-dotfiles) and command line configs.

Includes:

- [tmux](https://github.com/gpakosz/.tmux)
- [oh-my-zsh](https://github.com/ohmyzsh/ohmyzsh)
- shell functions & aliases
- brew formulas
- git configs

## Install

- **Quick install**
  One line install script:

  ```bash
  curl -sSL https://pub.anw.sh/get-dotfiles.sh | bash
  ```

- **Clone this repo**

  ```bash
  git clone git@github.com:zianwar/dotfiles.git ~/.dotfiles
  cd ~/.dotfiles
  git submodule update --init
  ```

- **Run setup script**

  ```bash
  ./setup.sh install   # Install required plugins and packages
  ./setup.sh sync      # Symlink dotfiles into ~/
  ```

1. **zsh auto-completion (optional)**
   Follow: [https://docs.brew.sh/Shell-Completion#configuring-completions-in-zsh](https://docs.brew.sh/Shell-Completion#configuring-completions-in-zsh)

2. **Install Brewfile packages**

   ```bash
   brew bundle   # Installs what's listed in Brewfile
   ```

## Clean up

To remove all linked dotfiles:

```bash
./setup.sh clean
```

---

### Apps I use not listed in [Brewfile](./Brewfile)
