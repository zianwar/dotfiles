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
	copybuffer # cltr-o to copy terminal buffer
	dirhistory # navigate cwd using keyboard
	fzf
	git
	history
	httpie
	macos
	ripgrep
	sudo # Easily prefix your current or previous commands with sudo by pressing esc twice.
	zsh-autosuggestions
	zsh-completions
	zsh-syntax-highlighting
	z
)

source $ZSH/oh-my-zsh.sh

# Load the shell dotfiles, and then some:
# * ~/.secret can be used for other settings you don’t want to commit.
for file in $DOTFILES/.{exports,aliases,functions,secret}; do
	test -e $file && source "$file"
done
unset file

# iTerm2 shell integration
test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

# fzf
# [ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
source <(fzf --zsh)

# Rust
source "$HOME/.cargo/env"

# bun completions
[ -s "/Users/anwar/.bun/_bun" ] && source "/Users/anwar/.bun/_bun"
