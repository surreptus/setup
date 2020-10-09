#!/bin/sh

# colors
off='\033[0m'
black='\033[0;30m'
red='\033[0;31m'
green='\033[0;32m'
yellow='\033[0;33m'
blue='\033[0;34m'
purple='\033[0;35m'
cyan='\033[0;36m'
white='\033[0;37m'

# utility
divider='------------------------------------------------------------'

alert () {
  echo "$divider\n${red}🛠  $1${off}\n$divider"
}

log () {
  case $2 in
    success)
      icon="✅";;
    warning)
      icon="⚠️ ";;
    *)
      icon="ℹ️ ";;
  esac

  echo "$icon $1"
}

exists () {
  command -v "$1" >/dev/null 2>&1
}

# install xcode
alert "installing system libraries"

if @ xcode-select -p &> /dev/null; then
  xcode-select --install
  log "xcode-select installed" "success"
else
  log "xcode-select already installed, skipping ..."
fi

alert "installing brew and CLI tools"

# brew
if exists brew; then
  log "brew already installed, updating ..."
  brew update
  log "finished updating brew" "success"
else
  curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh | bash
  log "finished installing brew" "success"
fi


# brew packages
brew install the_silver_searcher
brew install fzf
brew install vim 
brew install wget
brew link vim
brew cask install

log "finished installing brew packages" "success"

# install nvm
if exists nvm; then
  log "NVM already installed, skipping ..."
else
  wget -qO- https://raw.githubusercontent.com/nvm-sh/nvm/v0.36.0/install.sh | bash
  log "finished installing NVM" "success"
fi

if [ -d "~/.oh-my-zsh" ]; then
  log "oh-my-zsh already installed, skipping ..."
else
  wget https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh -O - | bash
  log "finished installing oh-my-zsh" "success"
fi

# .vimrc and .zshrc
# add source to the profiles directory
