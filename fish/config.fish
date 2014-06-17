set fish_path $HOME/.oh-my-fish
set fish_theme idan
# Oh-My-Fish's plugins
set fish brew extract node percol vundle tmux z
# Custom Fish's plugin
#set fish_custom $HOME/dotfiles/oh-my-fish
. $fish_path/oh-my-fish.fish
# Remove Fish's greeting
set -g -x fish_greeting ''
# Aliases
alias vim="mvim -v"
alias vi="mvim -v"
