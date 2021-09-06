#!/usr/bin/env sh

# Path to oh-my-zsh installation.
export DOTFILES=$HOME/.dotfiles
export ZSH="$DOTFILES/oh-my-zsh"

# oh-my-zsh variables
ZSH_THEME="ep"
CASE_SENSITIVE="false"
DISABLE_AUTO_UPDATE="true"

# oh-my-zsh plugins
plugins=(git zsh-completions history zsh-syntax-highlighting z)
source $ZSH/oh-my-zsh.sh

# Load the shell dotfiles, and then some:
# * ~/.extra can be used for other settings you don’t want to commit.
for file in $DOTFILES/.{exports,aliases,functions,extra}; do
	test -e $file && source "$file";
done;
unset file;

# iTerm2 shell integration
test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"
