# Path to oh-my-zsh installation.
export DOTFILES=$HOME/.dotfiles
export ZSH=$HOME/.dotfiles/oh-my-zsh

# oh-my-zsh variables
ZSH_THEME="ep"
CASE_SENSITIVE="false"
DISABLE_AUTO_UPDATE="true"

source $DOTFILES/aliases.zsh
source $DOTFILES/functions.zsh
source $DOTFILES/secrets.zsh

# oh-my-zsh plugins
plugins=(git osx zsh-completions history zsh-syntax-highlighting colorize docker z command-not-found gitignore golang)
source $ZSH/oh-my-zsh.sh
eval $(/usr/libexec/path_helper -s)
autoload -U compinit && compinit

# User configuration
export PATH=/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin:/usr/local/sbin

# Git
export PATH="$PATH:/usr/local/git/bin:/usr/bin/git"

# Compilation flags
export ARCHFLAGS="-arch x86_64"

# SSH key path
export SSH_KEY_PATH="~/.ssh/dsa_id"

# MYSQL commands
export PATH="$PATH:/usr/local/mysql/bin"

export LANG=en_US.UTF-8
export EDITOR='nano'

# Golang
export GOPATH=~/gocode
export PATH="$PATH:$GOPATH/bin"

# gcloud
source '/usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/path.zsh.inc'
source '/usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/completion.zsh.inc'

# iTerm2
test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

# Yarn global modules bin
export PATH="$PATH:$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin"

# nvm
export NVM_DIR="$HOME/.nvm"
[ -s "/usr/local/opt/nvm/nvm.sh" ] && . "/usr/local/opt/nvm/nvm.sh"  # This loads nvm
[ -s "/usr/local/opt/nvm/etc/bash_completion" ] && . "/usr/local/opt/nvm/etc/bash_completion"  # This loads nvm bash_completion

# Ensures that a specific version of node is used inside a specific folder
if [[ -a $DOTFILES/node-version-adapter.zsh ]]; then
  source $DOTFILES/node-version-adapter.zsh
fi