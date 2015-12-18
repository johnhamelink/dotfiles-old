zgen oh-my-zsh plugins/osx
zgen oh-my-zsh plugins/xcode
zgen oh-my-zsh plugins/brew

# Chruby
source /usr/local/opt/chruby/share/chruby/chruby.sh
chruby ruby-2.2

# Exenv
if which exenv > /dev/null; then eval "$(exenv init -)"; fi

# AWS CLI
source /usr/local/share/zsh/site-functions/_aws

# Find a Player
export PATH="$PATH:/Users/john/Public/fap/devops_scripts" # Add Fap Devops scripts to path

# Docker
eval "$(docker-machine env default)"

# Postgres.app
export PATH=$PATH:/Applications/Postgres.app/Contents/Versions/9.4/bin

# Gephi
alias gephi="~/Applications/Gephi.app/Contents/MacOS/Gephi --jdkhome $(/usr/libexec/java_home -v 1.7)"
