# .dotfile
# fish - mm function

function mm -d "Quickly setup multiple monitors"
  set opt $argv[1]
  set orien ''

  switch "$opt"
    case duplicate dup
      xrandr --auto
      return

    case reset re
      xrandr -s 0
      return

    case right-of right r
      set orien 'right-of'

    case left-of left l
      set orien 'left-of'

    case above a
      set orien 'above'

    case below b
      set orien 'below'

    # customs
    case t
      xrandr --output DisplayPort-0 --off \
      --output HDMI-0 --mode 1920x1200 --pos 0x0      --rotate normal \
      --output HDMI-1 --mode 1920x1200 --pos 1920x0   --rotate normal\
      --output eDP-0  --mode 1920x1080 --pos 928x1200 --rotate normal
      return

    case '*'
      echo "Error: Unkown option '$opt'"
      return 1
  end

  set stock 'eDP-0'
  set last $stock

  for screen in (xrandr | grep -E '\sconnected' | awk '{ print $1 }')
    if [ $screen = $stock ]; continue; end

    xrandr --output $screen --auto --$orien $last
    set last $screen
  end
end
