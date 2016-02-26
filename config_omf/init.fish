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
# Regular commands
alias df='df -h'
alias du='du -h'
# Replace system's vim with macvim (brew install macvim)
alias vim="mvim -v"
alias vi="mvim -v"
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
alias resetdns='sudo killall -HUP mDNSResponder'

# Update eveything (except Mac App Store)
function update_all
  sudo gem update --system
  brew update
  brew upgrade --all
  brew cask update
  omf update
  #npm -gf update
  npm -g update
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

# Remove all DS_Store
function removeDsStore
  find . -name '*.DS_Store' -type f -delete
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
set -x ANDROID_HOME ~/Library/Android/sdk
set -x PATH /usr/local/sbin $PATH $ANDROID_HOME/platform-tools $ANDROID_HOME/tools
set -x JAVA_HOME=/Library/Java/Home
# Some environmental variables for NodeJS
set -x NODE_PATH /usr/local/lib/node_modules
# Set priority on imported binaries rather than system's ones
set -x PATH ~/.meteor/tools/latest/bin:/usr/local/sbin:/usr/local/bin:$PATH:/usr/bin:/bin:/usr/sbin:/sbin
# Environment for ATOM
set -x ATOM_PATH /opt/homebrew-cask/Caskroom/atom/latest
# Docker
alias d='docker'
alias dp='d ps'
alias dpa='dp -a'
alias di='d images'
alias dm='docker-machine'
alias dc='docker-compose'

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
