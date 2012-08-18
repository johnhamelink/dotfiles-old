# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh



# af-magic.zsh-theme
# afowler.zsh-theme
# alanpeabody.zsh-theme
# apple.zsh-theme
# arrow.zsh-theme
# aussiegeek.zsh-theme
# awesomepanda.zsh-theme
# bira.zsh-theme
# blinks.zsh-theme
# candy.zsh-theme
# clean.zsh-theme
# cloud.zsh-theme
# crunch.zsh-theme
# cypher.zsh-theme
# dallas.zsh-theme
# darkblood.zsh-theme
# daveverwer.zsh-theme
# dieter.zsh-theme
# dogenpunk.zsh-theme
# dpoggi.zsh-theme
# dstufft.zsh-theme
# dst.zsh-theme
# duellj.zsh-theme
# eastwood.zsh-theme
# edvardm.zsh-theme
# evan.zsh-theme
# example.zsh-theme
# fino-time.zsh-theme
# fino.zsh-theme
# fishy.zsh-theme
# flazz.zsh-theme
# fletcherm.zsh-theme
# fox.zsh-theme
# frisk.zsh-theme
# funky.zsh-theme
# fwalch.zsh-theme
# gallifrey.zsh-theme
# gallois.zsh-theme
# garyblessington.zsh-theme
# gentoo.zsh-theme
# geoffgarside.zsh-theme
# gnzh.zsh-theme
# gozilla.zsh-theme
# humza.zsh-theme
# imajes.zsh-theme
# jbergantine.zsh-theme
# jispwoso.zsh-theme
# jnrowe.zsh-theme
# jonathan.zsh-theme
# josh.zsh-theme
# jreese.zsh-theme
# jtriley.zsh-theme
# juanghurtado.zsh-theme
# kardan.zsh-theme
# kennethreitz.zsh-theme
# kolo.zsh-theme
# kphoen.zsh-theme
# lambda.zsh-theme
# linuxonly
# lukerandall.zsh-theme
# macovsky-ruby.zsh-theme
# macovsky.zsh-theme
# maran.zsh-theme
# mgutz.zsh-theme
# mh.zsh-theme
# mikeh.zsh-theme
# miloshadzic.zsh-theme
# minimal.zsh-theme
# mortalscumbag.zsh-theme
# mrtazz.zsh-theme
# murilasso.zsh-theme
# muse.zsh-theme
# nanotech.zsh-theme
# nebirhos.zsh-theme
# nicoulaj.zsh-theme
# norm.zsh-theme
# obraun.zsh-theme
# philips.zsh-theme
# pmcgee.zsh-theme
# pygmalion.zsh-theme
# re5et.zsh-theme
# rgm.zsh-theme
# risto.zsh-theme
# rixius.zsh-theme
# rkj-repos.zsh-theme
# rkj.zsh-theme
# robbyrussell.zsh-theme
# sammy.zsh-theme
# simple.zsh-theme
# skaro.zsh-theme
# smt.zsh-theme
# Soliah.zsh-theme
# sorin.zsh-theme
# sporty_256.zsh-theme
# steeef.zsh-theme
# sunaku.zsh-theme
# sunrise.zsh-theme
# superjarin.zsh-theme
# suvash.zsh-theme
# takashiyoshida.zsh-theme
# terminalparty.zsh-theme
# theunraveler.zsh-theme
# tjkirch.zsh-theme
# tonotdo.zsh-theme
# trapd00r.zsh-theme
# wedisagree.zsh-theme
# wezm.zsh-theme
# wezm+.zsh-theme
# wuffers.zsh-theme
# xiong-chiamiov-plus.zsh-theme
# xiong-chiamiov.zsh-theme
# zhann.zsh-theme

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="terminalparty"

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git command-not-found extract history-substring-search node npm nyan vundle)

source $ZSH/oh-my-zsh.sh


# key bindings
bindkey "\e[1~" beginning-of-line
bindkey "\e[4~" end-of-line
bindkey "\e[5~" beginning-of-history
bindkey "\e[6~" end-of-history
bindkey "\e[3~" delete-char
bindkey "\e[2~" quoted-insert
bindkey "\e[5C" forward-word
bindkey "\eOc" emacs-forward-word
bindkey "\e[5D" backward-word
bindkey "\eOd" emacs-backward-word
bindkey "\ee[C" forward-word
bindkey "\ee[D" backward-word
bindkey "\^H" backward-delete-word
# for rxvt
bindkey "\e[8~" end-of-line
bindkey "\e[7~" beginning-of-line
# for non RH/Debian xterm, can't hurt for RH/DEbian xterm
bindkey "\eOH" beginning-of-line
bindkey "\eOF" end-of-line
# for freebsd console
bindkey "\e[H" beginning-of-line
bindkey "\e[F" end-of-line
# completion in the middle of a line
bindkey '^i' expand-or-complete-prefix

# Customize to your needs...
export PATH=/usr/lib/lightdm/lightdm:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/home/john/Public/scripts
export NODE_PATH=/usr/lib/node_modules

alias nvim="(urxvt -name vim -e vim) &"
alias nirc="(urxvt -urgentOnBell -name weechat -e weechat-curses) &"
alias cmus="(urxvt -name cmus -e cmus) &"
alias alsamixer="(urxvt -name alsamixer -e alsamixer) &"
alias :q="exit"
alias logout="/usr/bin/gnome-session-quit --no-prompt"

# Show the MOTD
~/Public/scripts/letsCode.sh
