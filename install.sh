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
git clone https://github.com/Lokaltog/powerline-fonts.git
mkfontscale
mkfontdir
fc-cache -fv ~/.fonts

cd ~
echo "请在Terminal(控制台)菜单中设置字体为新安装的以for Powerline结尾命名的字体中的一种,例如DejaVu Sans Mono for Powerline Regular。"
echo "否则控制台下vim底部airline bar部分字符显示乱码."

