all: sync

sync:
	[ -f ~/.environment ] || ln -fs $(PWD)/.environment ~/.environment
	[ -f ~/.zshrc ] || ln -fs $(PWD)/.zshrc ~/.zshrc
	[ -f ~/.aliases ] || ln -fs $(PWD)/.aliases ~/.aliases
	[ -f ~/.exports ] || ln -fs $(PWD)/.exports ~/.exports
	[ -f ~/.functions ] || ln -fs $(PWD)/.functions ~/.functions
	[ -f ~/.gitconfig ] || ln -fs $(PWD)/.gitconfig ~/.gitconfig
	[ -f ~/.gitignore_global ] || ln -fs $(PWD)/.gitignore_global ~/.gitignore_global
	[ -f ~/.ripgreprc ] || ln -fs $(PWD)/.ripgreprc ~/.ripgreprc

	# don't show last login message
	touch ~/.hushlogin

clean:
	rm -f ~/.zshrc
	rm -f ~/.aliases
	rm -f ~/.exports
	rm -f ~/.environment
	rm -f ~/.functions
	rm -f ~/.gitconfig
	rm -f ~/.gitignore_global
	rm -f ~/.ripgreprc

.PHONY: all clean sync build run kill
