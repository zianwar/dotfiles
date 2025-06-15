if [ -f "$HOME/.environment" ]; then
	source "$HOME/.environment"
fi

# --- oh-my-zsh
export ZSH="$DOTFILES/oh-my-zsh"
export ZSH_CUSTOM=$ZSH/custom

CASE_SENSITIVE="false"
DISABLE_AUTO_UPDATE="false"
DISABLE_MAGIC_FUNCTIONS="true" # this prevents auto-escaping of urls and other "magic" stuff in $ZSH/lib/misc.zsh
ZSH_THEME="dpoggi"             # (awesomepanda) https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
if [[ "$(hostname)" == "a3r-m.local" ]]; then
	export ZSH_THEME="awesomepanda"
fi

# oh-my-zsh plugins
plugins=(
	docker
	fzf
	git
	history
	zsh-autosuggestions
	zsh-completions
	zsh-syntax-highlighting
	fzf-tab
	z
)

source $ZSH/oh-my-zsh.sh

# Load the shell dotfiles, and then some:
# * ~/.secret can be used for other settings you don’t want to commit.
for file in $DOTFILES/.{exports,aliases,functions,secret}; do
	test -e $file && source "$file"
done
unset file
