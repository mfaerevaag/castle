# .dotfile
# fish config

# variables
set -U FISH (dirname (status -f))

# theme
source $FISH/theme.fish

# greeting
source $FISH/greeting.fish

# aliases
source $FISH/aliases.fish

# bindings
source $FISH/bindings.fish

# PATH
# set MANPATH $MANPATH "/usr/local/man:/usr/local/mysql/man:/usr/local/git/man:$MANPATH"

# Mac OS X
if uname -a | grep "Darwin"
  set -U fish_user_paths $HOME/.cabal/bin # cabal

# Linux
else
  set -U fish_user_paths /usr/lib/node_modules # node
  set -U fish_user_paths $HOME/.cabal/bin # cabal
  set -U fish_user_paths (ruby -rubygems -e "puts Gem.user_dir")/bin # ruby
end

set -U fish_user_paths $fish_user_paths $HOME/bin
set -U fish_user_paths $fish_user_paths /usr/local/bin
