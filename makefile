install:
	ln -s $(CURDIR)/zshrc ~/.zshrc 
	ln -s $(CURDIR)/xdefaults ~/.xdefaults 
	ln -s $(CURDIR)/vimrc ~/.vimrc 
	cp -R $(CURDIR)/weechat/ ~/.weechat 
osx:
	./osx
