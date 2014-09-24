function wd -d 'warp directory'
  set output (_wd $argv)
  set ret $status

  if [ $ret -eq 0 ]
    cd "$output"
  else
    for line in $output
      echo $line
    end
  end
end
