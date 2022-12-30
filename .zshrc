# If you come from bash you might have to change your $PATH.
export PATH=/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/sbin

# Path to oh-my-zsh installation.
export DOTFILES=$HOME/.dotfiles
export ZSH="$DOTFILES/oh-my-zsh"
export ZSH_CUSTOM=$ZSH/custom

# oh-my-zsh config
ZSH_THEME="awesomepanda" # See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
CASE_SENSITIVE="false"
DISABLE_AUTO_UPDATE="false"

# Initialize homebrew
eval $(/opt/homebrew/bin/brew shellenv)

# Homebrew Shell Completions in zsh
# https://docs.brew.sh/Shell-Completion#configuring-completions-in-zsh
FPATH="$(brew --prefix)/share/zsh/site-functions:${FPATH}"

# oh-my-zsh plugins
plugins=(
	copybuffer # cltr-o to cppy terminal buffer
	copyfile   # `copyfile <filename>` copies content of file
	copydir    # copies current path
	dirhistory # navigate cwd using keyboard
	# dotenv   					# Automatically load your project ENV variables from .env file when you cd into project root directory
	fzf
	git
	history
	httpie
	osx
	ripgrep
	sudo # Easily prefix your current or previous commands with sudo by pressing esc twice.
	zsh-autosuggestions
	zsh-completions
	zsh_reload # reload shell using `src` command
	zsh-syntax-highlighting
	z
)

source $ZSH/oh-my-zsh.sh

# Load the shell dotfiles, and then some:
# * ~/.extra can be used for other settings you don’t want to commit.
for file in $DOTFILES/.{exports,aliases,functions,extra}; do
	test -e $file && source "$file"
done
unset file

# iTerm2 shell integration
test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

# fzf
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
