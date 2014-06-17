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
alias vim="mvim -v"
alias vi="mvim -v"
alias l="ls"
