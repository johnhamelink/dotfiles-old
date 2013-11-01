source ~/.antigen/antigen.zsh

antigen use oh-my-zsh

# Ruby/Rails stuff
antigen bundle bundler
antigen bundle rvm
antigen bundle gem
antigen bundle rails4
antigen bundle johnhamelink/rvm-zsh

# Make the terminal a nicer place to be: Linux Edition
antigen bundle archlinux
antigen bundle command-not-found
antigen bundle cp
antigen bundle fasd
antigen bundle docker
antigen bundle zsh-users/zsh-completions src


# Make the terminal a nicer place to be: ZSH Edition
# "If you want to use the zsh-syntax-highlighting script along with
# history-substring-search, then make sure that you load it *before* you load
# this script:"
antigen bundle zsh-users/zsh-syntax-highlighting 
antigen bundle history-substring-search

# Git stuff
antigen bundle git
antigen bundle git-extras
antigen bundle bobthecow/git-flow-completion

# Make the prompt pretty :3
antigen theme johnhamelink/norm-zsh norm

antigen apply

export EDITOR=vim

git-export() {
	git clone --depth=1 "$@"
	rm -rf "$2/.git"
}

uploadImage (){
    echo "Uploading... " $1
    curl -s -F "image=@$1" -F "key=486690f872c678126a2c09a9e196ce1b" http://imgur.com/api/upload.xml | grep -E -o "<original_image>(.)*</original_image>" | grep -E -o "http://i.imgur.com/[^<]*"
    shift
}

alias pacman="pacaur"
alias gksu="gksudo"
alias open="xdg-open"

alias server="ruby -run -e httpd . -p 3000"
alias ctags-ruby="ctags -R --exclude=.git --exclude=log --exclude=doc --exclude=tmp "$@" ~/.rvm/gems/`rvm current`/*"
