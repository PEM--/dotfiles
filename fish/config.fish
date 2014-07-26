# Regular Oh-My-Fish directory
set fish_path $HOME/.oh-my-fish
# Custom Fish's plugin
set fish_custom $HOME/dotfiles/oh-my-fish
# Theme
set fish_theme pem
# Oh-My-Fish's plugins
set fish brew extract node percol vundle tmux z
. $fish_path/oh-my-fish.fish
# Remove Fish's greeting
set -g -x fish_greeting ''
# Aliases
# ls enhancements
alias l="ls"
alias ls='ls -G'
alias ll='ls -Glh'
alias lll='ls -Glh | less'
alias l='ls'
alias la='ls -a'
# Replace system's vim with macvim (brew install macvim)
alias vim="mvim -v"
alias vi="mvim -v"
# cat with pygments
alias cat='~/dotfiles/utils/codecat.sh'
# a better top
alias top='htop'
# Quicklook in CLI
alias ql="qlmanage -p 2>/dev/null" # preview a file using QuickLook
# IP's address made simple
alias myip="dig +short myip.opendns.com @resolver1.opendns.com"
alias ips="ifconfig -a | perl -nle'/(\d+\.\d+\.\d+\.\d+)/ && print $1'"
# Create a simple HTTP server on port 8000 in the current dir
alias simpleserver='node /usr/local/bin/nano-server'
# Colortail: https://github.com/joakim666/colortail
alias tail='colortail -k ~/.colortail/conf.default '
# Trash: https://github.com/sindresorhus/trash
alias rm='trash'

# Update eveything (except Mac App Store)
function update_all
  sudo gem update --system
  brew update
  brew upgrade
  brew cask update
  npm -gf update
  #upgrade_oh_my_zsh
  #vundle-update
end

# Clean all caches
function clean_all
  sudo gem clean
  brew cleanup
  brew cask cleanup
  npm cache clean
end

# Exports
# Set default compilation and linking flags
set -x CPPFLAGS "-I/usr/local/opt/qt5/include"
set -x LDFLAGS "-L/usr/local/opt/qt5/lib"
# Set default editor
set -x EDITOR 'mvim -v'
# Optimize Make
set -x JOBS=2
# Some environmental variables mainly for Karma (web test runner)
set -x FIREFOX_BIN '/opt/homebrew-cask/Caskroom/firefox/latest/Firefox.app/Contents/MacOS/firefox'
set -x CHROME_BIN '/opt/homebrew-cask/Caskroom/google-chrome/stable-channel/Google Chrome.app/Contents/MacOS/Google Chrome'
# Some environmental variables mainly for Android's SDK
set -x ANDROID_HOME /usr/local/opt/android-sdk
set -x PATH $PATH:$ANDROID_HOME/platform-tools:$ANDROID_HOME/tools
set -x JAVA_HOME=/Library/Java/Home
# Some environmental variables for NodeJS
set -x NODE_PATH /usr/local/lib/node_modules
# Set priority on imported binaries rather than system's ones
set -x PATH ~/.meteor/tools/latest/bin:/usr/local/sbin:/usr/local/bin:$PATH:/usr/bin:/bin:/usr/sbin:/sbin
# Environment for ATOM
set -x ATOM_PATH /opt/homebrew-cask/Caskroom/atom/latest
