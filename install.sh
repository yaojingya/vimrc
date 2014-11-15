#!/bin/sh

if [ -d ~/.vim ]; then
	mv ~/.vim ~/.vim-backup
fi

if [ -f ~/.vimrc ]; then
	mv ~/.vimrc ~/.vimrc-backup
fi

vim +BundleInstall +qall
cd bundle/YouCompleteMe
./install.sh --clang-completer

