#!/bin/sh

current=$PWD
vimdir="$HOME/.vim"

if [ -d ~/.vim ]; then
	if [ "$current" != "$vimdir" ]; then
		echo "backup ~/.vim to ~/.vim-backup"
		mv ~/.vim ~/.vim-backup
		ln -s $current ~/.vim
	fi
else
	ln -s $current ~/.vim
fi

if [ -f ~/.vimrc ]; then
	echo "backup ~/.vimrc to ~/.vimrc-backup"
	mv ~/.vimrc ~/.vimrc-backup
fi

git submodule init
git submodule update

vim +BundleInstall +qall
cd bundle/YouCompleteMe
./install.sh --clang-completer
cd ../..

[ -d ~/.fonts ] || mkdir ~/.fonts
cp -f fonts/* ~/.fonts
cd ~/.fonts
chmod 644 ~/.fonts/*
mkfontscale
mkfontdir
fc-cache -fv

cd ~
