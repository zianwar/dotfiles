# If you come from bash you might have to change your $PATH.
export PATH=/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/sbin

# Path to oh-my-zsh installation.
export DOTFILES=$HOME/.dotfiles
export ZSH="$DOTFILES/oh-my-zsh"
export ZSH_CUSTOM=$ZSH/custom

# Initialize homebrew
eval $(/opt/homebrew/bin/brew shellenv)

# oh-my-zsh config
ZSH_THEME="awesomepanda" # See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
CASE_SENSITIVE="false"
DISABLE_AUTO_UPDATE="true"

# plugins
plugins=(
	git
	zsh-completions
	history
	zsh-syntax-highlighting
	zsh-autosuggestions
	z
	fzf
)

# Homebrew Shell Completions in zsh
# https://docs.brew.sh/Shell-Completion#configuring-completions-in-zsh
FPATH="$(brew --prefix)/share/zsh/site-functions:${FPATH}"

source $ZSH/oh-my-zsh.sh


# Load the shell dotfiles, and then some:
# * ~/.extra can be used for other settings you don’t want to commit.
for file in $DOTFILES/.{exports,aliases,functions,extra}; do
	test -e $file && source "$file";
done;
unset file;

# fnm (Node package manager)
eval "$(fnm env --use-on-cd)"

# source "$ZSH/custom/exports.zsh"
# source "$ZSH/custom/aliases.zsh"

# iTerm2 shell integration
test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
