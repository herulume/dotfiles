# .bash_profile

# Get the aliases and functions
if [ -f ~/.bashrc ]; then
    . ~/.bashrc
fi

# User specific environment and startup programs

if [ "$(tty)" = "/dev/tty1" ]; then
    pgrep -x cwm || exec startx
fi

# opam configuration
test -r /home/herulume/.opam/opam-init/init.sh && . /home/herulume/.opam/opam-init/init.sh > /dev/null 2> /dev/null || true
