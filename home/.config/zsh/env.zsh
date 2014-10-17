# .dotfile
# system/env.zsh


# Mac OS X
if [ `uname -a | grep -c "Darwin"` -gt 0 ]
then
    # ssh
    export SSH_PRIVATE_KEY_PATH="~/.ssh/id_rsa"
    export SSH_PUBLIC_KEY_PATH="~/.ssh/id_rsa.pub"

# Linux
else
    export TERM=rxvt-unicode-256color
    export BROWSER=chromium
    export EDITOR=vim #e

    # compilation flags
    export ARCHFLAGS="-arch x86_64"

    # ssh
    export SSH_PRIVATE_KEY_PATH="~/.ssh/id_rsa"
    export SSH_PUBLIC_KEY_PATH="~/.ssh/id_rsa.pub"
fi
