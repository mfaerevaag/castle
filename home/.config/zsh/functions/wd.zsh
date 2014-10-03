# .dotfile
# functions/wd.zsh

# fpath=(~/Dev/code/shell/wd $fpath)

# wd() {
#     . ~/Dev/code/shell/wd/wd.sh
# }


wd() {
    output=$(_wd $@)
    ret=$?

    if [[ "$output" != "" ]]
    then
        if [[ $ret -eq 0  ]]
        then
            cd "$output"
        else
            echo "$output"
        fi
    fi

    unset output
    unset ret
}
