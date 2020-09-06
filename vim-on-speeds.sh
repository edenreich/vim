#!/bin/sh

function install_for_linux
{
	sudo apt-get -y update
	
	# todo install nodejs and npm for coc

	if [ ! vim ]; then
		echo "vim is not installed. Installing vim..."
		sudo apt-get install -y vim
	fi

	if [ ! -d "$HOME/.vim/autoload/plug.vim..." ]; then
		echo "Plug is not installed. Installing Plug"
		curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	fi

	vim +PlugInstall

}

function install_for_macos
{
	if [ ! vim ]; then
		echo "vim is not installed. Installing vim"
		brew install vim
	fi
}

if [ "$OSTYPE" == 'linux-gnu' ]; then
	install_for_linux
else
	install_for_macos
fi	
