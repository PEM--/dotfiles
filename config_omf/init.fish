# Remove Fish's greeting
set -g -x fish_greeting ''
# Key bindings
# CTRL+k: Set current process in foreground
bind \ck 'fg %'
# Aliases
# ls enhancements
alias l="ls"
alias ls='ls -G'
alias ll='ls -Glh'
alias lll='ls -Glh | less'
alias l='ls'
alias la='ls -a'
# Regular commands
alias df='df -h'
alias du='du -h'
# Replace system's vim with macvim (brew install macvim)
alias vim="/usr/local/opt/macvim/MacVim.app/Contents/MacOS/Vim -v"
alias vi="/usr/local/opt/macvim/MacVim.app/Contents/MacOS/Vim -v"
# cat with Pygments: sudo easy_install Pygments
alias cat='~/dotfiles/utils/codecat.sh'
# Quicklook in CLI
alias ql="qlmanage -p 2>/dev/null" # preview a file using QuickLook
# IP's address made simple
alias myip="dig +short myip.opendns.com @resolver1.opendns.com"
alias ips="ifconfig -a | perl -nle'/(\d+\.\d+\.\d+\.\d+)/ && print $1'"
# Create a simple HTTP server on port 8000 in the current dir
alias simpleserver='node /usr/local/bin/nano-server'
# Colortail: https://github.com/joakim666/colortail
alias tail='colortail -k ~/.colortail/conf.default '
# Trash: npm -g install trash
alias rm='trash'
# Cpy: npm -g install cpy
#alias cp='cpy'
# Htop
#alias top='htop'
# VTop: npm -g install vtop
alias top='vtop'
# Mkdirp: npm -g install mkdirp
alias mkdir='mkdirp'
# Reset DNS cache
alias dnsreset='sudo killall -HUP mDNSResponder'
# Atom alias
alias editor='Atom'
alias atom='Atom'

# Update eveything (except Mac App Store)
function update_all
  sudo gem update --system
  brew update
  brew upgrade
  #brew cask update
  omf update
  #npm -gf update
  npm -g update
  #vundle-update
end

# Clean all caches
function clean_all
  sudo gem clean
  brew cleanup
  brew cask cleanup
  npm cache verify
end

# Remove all DS_Store
function removeDsStore
  find . -name '*.DS_Store' -type f -delete
end

# Exports
# Set default compilation and linking flags
set -xg CPPFLAGS "-I/usr/local/opt/qt5/include"
set -xg LDFLAGS "-L/usr/local/opt/qt5/lib"
# Set default editor
set -xg EDITOR '/usr/bin/vi'
# Optimize Make
set -xg JOBS 2
# Set Android SDK
set -xg ANDROID_HOME $HOME/Library/Android/sdk
set -x PATH $PATH $ANDROID_HOME/tools $ANDROID_HOME/platform-tools $ANDROID_HOME/build-tools
#set -xg ANDROID_HOME $HOME/android-sdk
#set -xg PATH $PATH $ANDROID_HOME $ANDROID_HOME/bin $ANDDROID_HOME/platform-tools $ANDROID_HOME/tools
# Some environmental variables mainly for Karma (web test runner)
set -xg FIREFOX_BIN '/opt/homebrew-cask/Caskroom/firefox/latest/Firefox.app/Contents/MacOS/firefox'
set -xg CHROME_BIN '/opt/homebrew-cask/Caskroom/google-chrome/stable-channel/Google Chrome.app/Contents/MacOS/Google Chrome'
# Some environmental variables for NodeJS
set -xg NODE_PATH /usr/local/lib/node_modules
# VS Code
set -xg VSCODE_TSJS 1
# Docker
alias d='docker'
alias dp='d ps'
alias dpa='dp -a'
alias di='d images'
alias dm='docker-machine'
alias dc='docker-compose'
# Remove dangling images
alias removeDangling='docker images -qf dangling=true | xargs docker rmi'
# Less with colors by default
alias less='less -R'

# Configuration for plugin-peco
function peco_select_history
  if test (count $argv) = 0
    set peco_flags --layout=bottom-up
  else
    set peco_flags --layout=bottom-up --query "$argv"
  end
  history|peco $peco_flags|read foo
  if [ $foo ]
    commandline $foo
  else
    commandline ''
  end
end

# Add yarn's bin path
set -xg YARN_BIN (yarn global bin | grep -o '/.*')
set -x PATH $YARN_BIN $PATH
