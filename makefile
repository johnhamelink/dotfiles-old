/*install: installUrxvt installWeechat installZSH installVim*/
install: installWeechat installVim
uninstall: uninstallUrxvt uninstallWeechat uninstallZSH uninstallVim

installUrxvt:
	ln -s $(CURDIR)/xdefaults ~/.xdefaults

uninstallUrxvt:
	rm -f ~/.xdefaults


installWeechat:
	ln -s $(CURDIR)/weechat ~/.weechat

uninstallWeechat:
	rm -rf ~/.weechat


installZSH:
	ln -s $(CURDIR)/zshrc ~/.zshrc

uninstallZSH:
	rm -f ~/.zshrc

installVim:
	# Create the symlinks to vim
	ln -s $(CURDIR)/vim/vimrc ~/.vimrc
	ln -s $(CURDIR)/vim ~/.vim

	# Make the temporary directories
	mkdir -p $(CURDIR)/vim/tmp/undo
	mkdir -p $(CURDIR)/vim/tmp/backup

	# Use Vundle to install the bundles
	# Specified in the .vimrc
	vim +BundleInstall +qall

uninstallVim:
	rm -f ~/.vimrc
	rm -rf $(CURDIR)/tmp/undo
	rm -rf $(CURDIR)/tmp/backup

osx:
	./osx
