# .dotfile
# functions/mhead.zsh
# simple script for settings up multi head

mhead() {
    case "$1" in
        dup|duplicate)
            xrandr --auto
            ;;
        single|reset)
            xrandr -s 0
            ;;
    esac

    readonly ORIEN=$1

    local usage="Usage: mhead {single|dual|triple} [rightof|leftof|above]"

    local last='eDP1'
    for s in `xrandr | grep -E '\sconnected' | awk '{ print $1 }'`
    do
        if [[ $s != "eDP1" ]]
        then
            xrandr --output $s --auto --$ORIEN $last
            last=$s
        fi
    done
}
