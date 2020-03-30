# .bash_profile

# Get the aliases and functions
if [ -f ~/.bashrc ]; then
    . ~/.bashrc
fi

# User specific environment and startup programs

if [ "$(tty)" = "/dev/tty1" ]; then
    pgrep -x cwm || exec startx
fi
