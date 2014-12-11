# .dotfile
# fish config

# variables
set -U FISH (dirname (status -f))

# theme
source $FISH/themes/robby-russel.fish
#source $FISH/themes/bobthefish/fish_prompt.fish

# greeting
source $FISH/greeting.fish

# aliases
source $FISH/aliases.fish

# bindings
source $FISH/bindings.fish

# PATH
set PYTHONPATH /usr/lib/python3.3/site-packages # python
set PATH $HOME/bin /usr/local/bin /usr/lib/node_modules $HOME/.cabal/bin (ruby -rubygems -e "puts Gem.user_dir")/bin $PATH
