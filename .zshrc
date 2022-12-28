# Path to oh-my-zsh installation.
export DOTFILES=$HOME/.dotfiles
export ZSH="$HOME/.oh-my-zsh"

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

source $ZSH/oh-my-zsh.sh

if type brew &>/dev/null; then
FPATH=$(brew --prefix)/share/zsh-completions:$FPATH

autoload -Uz compinit
compinit
fi

# Load the shell dotfiles, and then some:
# * ~/.extra can be used for other settings you don’t want to commit.
for file in $DOTFILES/.{exports,aliases,functions,extra}; do
	test -e $file && source "$file";
done;
unset file;

# source "$ZSH/custom/exports.zsh"
# source "$ZSH/custom/aliases.zsh"

# iTerm2 shell integration
test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"
