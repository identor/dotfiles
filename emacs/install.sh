#!/bin/sh

EMACSRC="`dirname $0`/emacs.lisp"
FILES_DIR=`dirname $0`

if [ ! -f $HOME/.emacs ]; then
    ln -s `pwd`/$EMACSRC $HOME/.emacs
fi

if [ ! -d $HOME/.emacs.d/evil ]; then
    git clone https://github.com/emacs-evil/evil ~/.emacs.d/evil
fi
