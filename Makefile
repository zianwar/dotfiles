all: sync

sync:
	[ -f ~/.zshrc ] || ln -fs $(PWD)/.zshrc ~/.zshrc
	[ -f ~/.aliases ] || ln -fs $(PWD)/.aliases ~/.aliases
	[ -f ~/.exports ] || ln -fs $(PWD)/.exports ~/.exports
	[ -f ~/.functions ] || ln -fs $(PWD)/.functions ~/.functions
	[ -f ~/.gitconfig ] || ln -fs $(PWD)/.gitconfig ~/.gitconfig
	[ -f ~/.gitignore_global ] || ln -fs $(PWD)/.gitignore_global ~/.gitignore_global
	[ -f ~/.tmux.conf ] || ln -fs $(PWD)/.tmux/.tmux.conf ~/.tmux.conf
	[ -f ~/.config/karabiner.json ] || ln -fs $(PWD)/.karabiner.json ~/.config/karabiner.json

	# don't show last login message
	touch ~/.hushlogin

clean:
	rm -f ~/.zshrc
	rm -f ~/.gitconfig
	rm -f ~/.gitignore_global
	rm -f ~/.tmux.conf
	rm -f ~/.tmux.conf.local

.PHONY: all clean sync build run kill
