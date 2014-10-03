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

# wifi
function wires
  sudo ip link set wlan0 down
  sudo netctl stop-all
end

function wicon
  sudo netctl start $argv
end
