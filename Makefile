all: sync

sync:
	[ -f ~/.zshrc ] || ln -s $(PWD)/.zshrc ~/.zshrc
	[ -f ~/.gitconfig ] || ln -s $(PWD)/.gitconfig ~/.gitconfig
	[ -f ~/.gitignore_global ] || ln -s $(PWD)/.gitignore_global ~/.gitignore_global
	[ -f ~/.tmux.conf ] || ln -s $(PWD)/.tmux/.tmux.conf ~/.tmux.conf
	[ -f ~/.tmux.conf.local ] || cp $(PWD)/.tmux.conf.local ~/.tmux.conf.local

	# don't show last login message
	touch ~/.hushlogin

clean:
	rm -f ~/.zshrc
	rm -f ~/.tmux.conf
	rm -f ~/.tmux.conf.local
	rm -f ~/.git-prompt.sh
	rm -f ~/.gitconfig
	rm -f ~/.gitignore_global

.PHONY: all clean sync build run kill
