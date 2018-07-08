#!/bin/sh

VIMRC="`dirname $0`/vimrc"
VUNDLE_URL=https://github.com/VundleVim/Vundle.vim
VUNDLE_DIR=$HOME/.vim/bundle/Vundle.vim
FILES_DIR=`dirname $0`
VIMHOME=$HOME/.vim
VIMHOME_WINDOWS=$HOME/vimfiles

init () {
    if [ -d $VIMHOME_WINDOWS ]; then
        rm -Rf $VIMHOME_WINDOWS
    fi

    # create vim dirs
    echo "Creating default directories"
    mkdir -p $HOME/.vimswap
    mkdir -p $VIMHOME/sessions
    mkdir -p $VIMHOME/bundle
    mkdir -p $VIMHOME/ftplugin
    mkdir -p $VIMHOME/syntax
}

init

echo "Copying files dir"
cp -r $FILES_DIR/mclinica $VIMHOME/.
cp -r $FILES_DIR/snippets $VIMHOME/.
cp -r $FILES_DIR/ftplugin $VIMHOME/.
cp -r $FILES_DIR/syntax $VIMHOME/.

# Copy vimrc
echo "Copying .vimrc"
cp $VIMRC $HOME/.vimrc

# Install vundle
if [ ! -e $VUNDLE_DIR ];
then
    git clone $VUNDLE_URL $VUNDLE_DIR
fi

ln -Ts $VIMHOME $VIMHOME_WINDOWS

# Install Bundles
vim +PluginInstall +qa

echo "Install complete"

