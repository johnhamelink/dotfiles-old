if ! zgen saved; then
  zgen oh-my-zsh plugins/archlinux
  zgen oh-my-zsh plugins/fasd
  zgen oh-my-zsh plugins/systemd
fi

alias pacman="pacaur"
alias gksu="gksudo"
alias open="xdg-open"
export BROWSER="chromium"
alias term="termite . &> /dev/null"

whiteboardify (){
    convert "$1" -morphology Convolve DoG:15,100,0 -negate -normalize -blur 3x1 -channel RBG -level 60%,91%,0.1 "$2"
}
