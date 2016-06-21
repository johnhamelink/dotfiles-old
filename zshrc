zmodload zsh/zprof

export EDITOR=nvim
export PATH="$PATH:$HOME/.dotfiles/scripts"

screenshot (){
  echo "Taking Screenshot..."
  maim -s screenshot.png
  uploadImage screenshot.png
}

uploadImage (){
    echo "Uploading... " $1
    curl -s -F "image=@$1" -F "key=486690f872c678126a2c09a9e196ce1b" http://imgur.com/api/upload.xml | grep -E -o "<original_image>(.)*</original_image>" | grep -E -o "http://i.imgur.com/[^<]*"
    shift
}

compressPdf() {
  gs -sDEVICE=pdfwrite -dNOPAUSE -dQUIET -dBATCH -dPDFSETTINGS=/${3:-"screen"} -dCompatibilityLevel=1.4 -sOutputFile=$2 $1
}

ctags_ruby (){
  echo "Running ctags on current directory as well as all the bundled gems..."
  ctags -R --exclude=.git --exclude=log --exclude=doc --exclude=tmp ./ $(bundle list --paths)
  echo "Done"
}

dexcount (){
  `cp $1 $1+copy >/dev/null`
  `mkdir temp >/dev/null`
  `cp $1 temp/$1+copy > /dev/null`
  `unzip temp/$1+copy > /dev/null`
  cat temp/classes.dex | head -c 92 | tail -c 4 | hexdump -e '1/4 "%d\n"'
  rm -R temp > /dev/null
}

alias server="ruby -run -e httpd . -p 3210"
alias stats="inxi -F -M -c 31"
alias lsmount="mount | column -t"
alias vim="nvim"
alias diff="colordiff"

export TERM="xterm-256color"

source ~/.zgen/zgen.zsh

if ! zgen saved; then
  echo "Creating a zgen save"
  zgen oh-my-zsh

  # Servers
  zgen oh-my-zsh plugins/ssh-agent
  zgen oh-my-zsh plugins/aws
  zgen oh-my-zsh plugins/vagrant

  # Java / Android
  zgen oh-my-zsh plugins/gradle
  zgen oh-my-zsh plugins/adb

  # Elixir
  zgen oh-my-zsh plugins/mix
  zgen load dalexj/mix_autocomplete mix_autocomplete.zsh

  # Ruby/Rails stuff
  zgen oh-my-zsh plugins/bundler
  zgen oh-my-zsh plugins/gem
  zgen oh-my-zsh plugins/rbenv

  # EmberJS
  zgen oh-my-zsh plugins/ember-cli

  # Pairing
  zgen oh-my-zsh plugins/tmux

  # Make the terminal a nicer place to be: Linux Edition
  zgen oh-my-zsh plugins/command-not-found
  zgen oh-my-zsh plugins/cp
  zgen oh-my-zsh plugins/docker
  zgen load zsh-users/zsh-completions src

  # Make the terminal a nicer place to be: ZSH Edition
  # "If you want to use the zsh-syntax-highlighting script along with
  # history-substring-search, then make sure that you load it *before* you load
  # this script:"
  zgen load zsh-users/zsh-syntax-highlighting
  zgen oh-my-zsh plugins/history-substring-search

  # Autoupdate zgen
  zgen load unixorn/autoupdate-zgen

  # Open the last working directory for new shells
  zgen oh-my-zsh plugins/last-working-dir

  # Git stuff
  zgen oh-my-zsh plugins/git
  zgen oh-my-zsh plugins/git-extras
  zgen load bobthecow/git-flow-completion

  # Prettiness
  zgen load nojhan/liquidprompt

fi

  # Source os-specific files.
  envfile="$HOME/.dotfiles/zsh/`uname`.sh"
  if [ -r $envfile ]; then
    . $envfile
  fi

  envfile="$HOME/.dotfiles/zsh/`uname -n`.sh"
  if [ -r $envfile ]; then
    . $envfile
  fi

if ! zgen saved; then
  zgen save
fi

source "$HOME/.zprofile"
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

. /Users/john/.opam/opam-init/init.zsh > /dev/null 2> /dev/null || true
export JENV_ROOT=/usr/local/var/jenv
if which jenv > /dev/null; then eval "$(jenv init -)"; fi

source "$HOME/.dotfiles/zsh/dotenv.zsh"
