# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh
# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
# ZSH_THEME="miloshadzic"
ZSH_THEME="sorin"

# Use emacs keybindings even if our EDITOR is set to vi
bindkey -e

# Keep 1000 lines of history within the shell and save it to ~/.zsh_history:
HISTSIZE=1000
SAVEHIST=1000
HISTFILE=~/.zsh_history

# Set best compilation and linking support by default
#export CFLAGS="-march=native -O3 -pipe"
#export LDFLAGS="-Wl,-O1 -Wl,--sort-common -Wl,--as-needed"
#export CXXFLAGS="${CFLAGS}"
export CPPFLAGS="-I/usr/local/opt/qt5/include"
export LDFLAGS="-L/usr/local/opt/qt5/lib"

# Fixing CTRL-Arrow left and right
bindkey ';5D' emacs-backward-word
bindkey ';5C' emacs-forward-word

# Update solarized colors for ls
#eval `gdircolors ~/.dircolors`

# cat with pygments
alias cat='~/dotfiles/utils/codecat.sh'

# Oh-my-zsh plugins
plugins=(git bower brew cake coffee colored-man colorize cp dircycle extract gem git history node npm osx pass pip python redis-cli terminalapp themes urltools vundle web-search)

source $ZSH/oh-my-zsh.sh

# Some quick aliases
alias ls='ls -G'
alias ll='ls -Glh'
alias lll='ls -Glh | less'
alias l='ls'
alias la='ls -a'
alias top='htop'
alias ql="qlmanage -p 2>/dev/null" # preview a file using QuickLook
alias myip="dig +short myip.opendns.com @resolver1.opendns.com"
alias ips="ifconfig -a | perl -nle'/(\d+\.\d+\.\d+\.\d+)/ && print $1'"
# Create a simple HTTP server on port 8000 in the current dir
alias simpleserver='python -m SimpleHTTPServer'
# Replace system's vim with macvim (brew install macvim)
alias vim='mvim -v'

# Update eveything (except Mac App Store)
update_all() {
  sudo gem update --system
  brew update
  brew upgrade
  brew cask update
  npm -g update
  upgrade_oh_my_zsh
  vundle-update
}

# Clean all caches
clean_all() {
  sudo gem clean
  brew cleanup
  brew cask cleanup
  npm cache clean
}

# Set default editor
export EDITOR=vim

# Optimize Make
export JOBS=2

# Some environmental variables mainly for Karma (web test runner)
export FIREFOX_BIN='/opt/homebrew-cask/Caskroom/firefox/latest/Firefox.app/Contents/MacOS/firefox'
export CHROME_BIN='/opt/homebrew-cask/Caskroom/google-chrome/stable-channel/Google Chrome.app/Contents/MacOS/Google Chrome'

# Some environmental variables mainly for Android's SDK
export ANDROID_HOME=/usr/local/opt/android-sdk
export PATH=$PATH:$ANDROID_HOME/platform-tools:$ANDROID_HOME/tools
export JAVA_HOME=/Library/Java/Home

# Some environmental variables for NodeJS
export NODE_PATH=/usr/local/lib/node_modules

# Set priority on imported binaries rather than system's ones
export PATH=/usr/local/sbin:/usr/local/bin:$PATH:/usr/bin:/bin:/usr/sbin:/sbin
