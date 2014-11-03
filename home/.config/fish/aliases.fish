# .dotfile
# fish - aliases

function rm
  command rm -i $argv
end

function sd
  sudo systemctl $argv
end

function p
  sudo pacman $argv
end

function y
  yaourt $argv
end
