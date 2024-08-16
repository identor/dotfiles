#!/bin/sh

ln -s $(pwd)/git/gitconfig ~/.gitconfig
ln -s $(pwd)/git/gitconfig.mclinica ~/.gitconfig.mclinica
ln -s $(pwd)/git/gitconfig.bmi ~/.gitconfig.bmi

echo 'Symlinks created'
ls -lah ~/.git*
