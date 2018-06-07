#!/bin/sh

VIMRC="`dirname $0`/vimrc"
VUNDLE_URL=https://github.com/VundleVim/Vundle.vim
VUNDLE_DIR=$HOME/.vim/bundle/Vundle.vim
FILES_DIR=`dirname $0`

# create vim dirs
echo "Creating default directories"
mkdir -p $HOME/.vimswap
mkdir -p $HOME/.vim/sessions
mkdir -p $HOME/.vim/bundle
mkdir -p $HOME/.vim/ftplugin
mkdir -p $HOME/.vim/syntax

echo "Copying files dir"
cp -r $FILES_DIR/mclinica $HOME/.vim/.
cp -r $FILES_DIR/snippets $HOME/.vim/.
cp -r $FILES_DIR/ftplugin $HOME/.vim/.
cp -r $FILES_DIR/syntax $HOME/.vim/.

# Copy vimrc
echo "Copying .vimrc"
cp $VIMRC $HOME/.vimrc

# Install vundle
if [ ! -e $VUNDLE_DIR ];
then
	git clone $VUNDLE_URL $VUNDLE_DIR
fi

# Install Bundles
vim +PluginInstall +qa

echo "Install complete"

