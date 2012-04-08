John's Super-Duper Vim Config
==============================

Features:
---------

- Uses ctrl+p to help you navigate to files quickly
- Tagfiles are recursively searched up the filetree until one is found - this
  gives automatic project-wide access to tagfiles, so you only need to generate one.
- Powerline gives us a really cool bottom bar which adapts to the plugins you install and
  the mode you are currently in.
- Automatic JSON formatting
- Support for debugging with XDebug
- Inappropriate/stray whitespace detection and auto-deletion
- Paste files to Gist.github.com by selecting text and running :Gist
- Much, much more!


Preview:
--------

![Macvim for the terminal](http://i.imgur.com/8suZd.png)
Macvim in the terminal, showing two split files being edited at the same time.

The Red bars on the right are guides to which you should try not to let your code
go past for readability's sake.

On line 61 of the rightmost split, you can see that some stray whitespace has been
highlighted. When the file  is saved, this whitespace will be stripped automatically.

The "S>" in red on the bar on the leftmost split is depicting a problem that the linter
has picked up.

![Macvim GUI](http://i.imgur.com/4pcaQ.png)
Macvim GUI, depicting the slimline tabs as well as ctrl+p's brilliant file finding
functionality.


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

Dependencies:
-------------
My vim config has been tested to work on vim 7.2, but 7.3 or higher is recommended.
It should work fine on both OSX and Linux, but if you have any problems please let me
know, or contribute if you find a fix!

Make sure your system has the following tools installed:

 - cURL (OSX has this installed by default)

Installation:
------------
The installation is relatively simple:

    git clone git://github.com/johnhamelink/dotfiles.git ~/.vim
    ln -s ~/.vim/vimrc ~/.vimrc

That's all there is to it!

Submodules:
----------
This vim config uses pathogen, and so it heavily relies on submodules. To update them, simply run:

    cd ~/.vim
    git submodule init
    git submodule update --recursive

Lovely!