source ~/.antigen/antigen.zsh

export EDITOR=vim

git-export() {
  git clone --depth=1 "$@"
  rm -rf "$2/.git"
}

git-unmerged-into() {
  git branch --no-merged $@
}

git-merged-into() {
  git branch --merged $@
}

uploadImage (){
    echo "Uploading... " $1
    curl -s -F "image=@$1" -F "key=486690f872c678126a2c09a9e196ce1b" http://imgur.com/api/upload.xml | grep -E -o "<original_image>(.)*</original_image>" | grep -E -o "http://i.imgur.com/[^<]*"
    shift
}

ctags_ruby (){
  echo "Running ctags on current directory as well as all the bundled gems..."
  ctags -R --exclude=.git --exclude=log --exclude=doc --exclude=tmp ./ $(bundle list --paths)
  echo "Done"
}


alias server="ruby -run -e httpd . -p 3210"
alias stats="inxi -F -M -c 31"
alias brolink="node ~/.vim/bundle/brolink.vim/brolink/brolink.js"

antigen use oh-my-zsh

antigen bundles <<EOBUNDLES

  # Java
  gradle

  # Ruby/Rails stuff
  bundler
  rvm
  gem
  rails
  johnhamelink/rvm-zsh

  # Make the terminal a nicer place to be: Linux Edition
  command-not-found
  cp
  docker
  zsh-users/zsh-completions src
  johnhamelink/env-zsh


  # Make the terminal a nicer place to be: ZSH Edition
  # "If you want to use the zsh-syntax-highlighting script along with
  # history-substring-search, then make sure that you load it *before* you load
  # this script:"
  zsh-users/zsh-syntax-highlighting
  history-substring-search

  # Git stuff
  git
  git-extras
  bobthecow/git-flow-completion

EOBUNDLES


# Make the prompt pretty :3
antigen theme johnhamelink/norm-zsh norm

# Source os-specific files.
envfile="$HOME/.dotfiles/zsh/`uname`.sh"
if [ -r $envfile ]; then
  . $envfile
fi

envfile="$HOME/.dotfiles/zsh/`uname -n`.sh"
if [ -r $envfile ]; then
  . $envfile
fi

antigen apply
