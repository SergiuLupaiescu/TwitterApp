#! /usr/bin/zsh
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"
rvm use 2.7.2@twitter
rails s
echo "Setup script executed successfully!"