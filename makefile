installWM:
	ln -s $(CURDIR)/wmfs ~/.config
	ln -s $(CURDIR)/conkyrc ~/.conkyrc
	ln -s $(CURDIR)/xdefaults ~/.xdefaults

installZSH:
	# Clone zprezto
	git clone --recursive https://github.com/sorin-ionescu/prezto.git ~/.zprezto
	# Install custom files.
	ln -s $(CURDIR)/zsh/zlogin ~/.zlogin
	ln -s $(CURDIR)/zsh/zlogout ~/.zlogout
	ln -s $(CURDIR)/zsh/zpreztorc ~/.zpreztorc
	ln -s $(CURDIR)/zsh/zprofile ~/.zprofile
	ln -s $(CURDIR)/zsh/zshenv ~/.zshenv
	ln -s $(CURDIR)/zsh/zshrc ~/.zshrc

uninstallZSH:
	rm -rf ~/.zlogin
	rm -rf ~/.zlogout
	rm -rf ~/.zpreztorc
	rm -rf ~/.zprofile
	rm -rf ~/.zshenv
	rm -rf ~/.zshrc
	rm -rf ~/.zprezto

installWeechat:
	ln -s $(CURDIR)/weechat ~/.weechat

uninstallWeechat:
	rm -rf ~/.weechat

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
