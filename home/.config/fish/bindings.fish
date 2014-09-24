function _git_status
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

function reload!
  set_color green
  echo -e "\nreinitializing configs..."
  set_color normal

  source $FISH/config.fish

  commandline -f repaint
end

function fish_user_key_bindings
  bind \er reload!
  bind \el 'echo ''; ll; commandline -f repaint;'
  bind \ek _git_status
end
