#!/bin/bash

mkdir_if_needed() {
    if [ $# -ne 1 ] || [ ! -d $PWD/$1 ]; then
        echo "You or I am wrong.." 1>&2
        echo "$PWD/$1"
        exit 1
    fi
    if [ ! -d $HOME/$1 ]; then
        if  mkdir -p $HOME/$1; then
            echo "$HOME/$1 is created!"
            return 0
        else
            echo "failed to mkdir -p $HOME/$1 .. "
            return 1
        fi
    fi
    return 0
}

sym_to_home() {
    if [ $# -ne 1 ] || [ ! -e $PWD/$1 ]; then
        echo "file $1 does not exist. exit script .. " 1>&2
        exit 1
    elif [ -e $HOME/$1 ]; then
        echo "$HOME/$1 exists .. kept it .." 1>&2
        return 1
    fi

    if ln -s $PWD/$1 $HOME/$1; then
        echo "$HOME/$1 (symlink) is created!"
        return 0
    else
        echo "failed to create symlink $HOME/$1 .. "
        return 1
    fi
}
