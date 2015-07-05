# Test for an interactive shell.  There is no need to set anything
# past this point for scp and rcp, and it's important to refrain from
# outputting anything in those cases.
if [[ $- != *i* ]] ; then
    # Shell is non-interactive.  Be done now!
    return
fi

export LANG="en_US.UTF-8"
export LC_ALL="en_US.UTF-8"

#THIS MUST BE AT THE END OF THE FILE FOR GVM TO WORK!!!
[[ -s $HOME/.gvm/bin/gvm-init.sh ]] && source $HOME/.gvm/bin/gvm-init.sh

[ -s "/home/ggkuron/.dnx/dnvm/dnvm.sh" ] && . "/home/ggkuron/.dnx/dnvm/dnvm.sh" # Load dnvm
