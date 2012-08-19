install:
	ln -s $(CURDIR)/zshrc ~/.zshrc
	ln -s $(CURDIR)/xdefaults ~/.xdefaults
	ln -s $(CURDIR)/vimrc ~/.vimrc
	cp -R $(CURDIR)/weechat/ ~/.weechat
	mkdir -p $(CURDIR)/tmp/undo
	mkdir -p $(CURDIR)/tmp/backup
uninstall:
	rm -f ~/.zshrc
	rm -f ~/.vimrc
	rm -f ~/.xdefaults
	rm -rf ~/.weechat
	rm -rf $(CURDIR)/tmp/undo
	rm -rf $(CURDIR)/tmp/backup
osx:
	./osx
