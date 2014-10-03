# .dotfile
# fish - bindings

function _bind_git_status -d "Git status current directory"
  echo ''
  if git status > /dev/null ^ /dev/null
    git status
  else
    set_color red
    echo "Not a git repo!"
    set_color normal
  end
  commandline -f repaint
end

function _bind_grep -d "Grep current command"
  set -l cmd grep

  if commandline -j|grep -v "$cmd *\$" >/dev/null
    commandline -aj " | $cmd;"
  end
end

function reload!
  set_color green
  echo -e "\nreinitializing configs..."
  set_color normal

  source $FISH/config.fish

  commandline -f repaint
end

function fish_user_key_bindings
  bind \er reload! # reload config
  bind \el 'echo ''; ll; commandline -f repaint;' # ls -l
  bind \eg _bind_grep # grep
  bind \ek _bind_git_status # git status
end
