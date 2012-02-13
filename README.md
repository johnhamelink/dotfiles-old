John's Super-Duper Vim Config
==============================

Preface:
-------
Some (ok, a lot) of the config options I have in my config have been snipped from
other configs, here and there. If I've stolen something from you and you want
credit, I'll be more-than happy to add it in!

This config has only been tested on macvim and vim in the terminal (again on mac).
If you find an OS specific bug, _please_ contribute it so everyone benefits!

Contribute:
----------
Do you have an awesome contribution to my config? Submit a pull request!

Installation:
------------
The installation is relatively simple:

    git clone git://github.com/johnhamelink/dotfiles.git ~/.vim
	ln -s ~/.vim/bundle/dbgp-client/plugin/debugger.py ~/.vim
    ln -s ~/.vim/vimrc ~/.vimrc

That's all there is to it!

Submodules:
----------
This vim config uses pathogen, and so it heavily relies on submodules. To update them, simply run:

	cd ~/.vim
	git submodule foreach git pull --force

Lovely!