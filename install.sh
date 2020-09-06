#!/bin/sh
set -e

install_for_linux()
{
	echo '>> Updating...'
	apt-get update && apt-get -y upgrade	

	if [ ! `which git` ]; then
		echo '>> git is not installed. Installing git...'
		apt-get install -y git
	fi

	if [ ! `which curl` ]; then
		echo '>> curl is not installed. Installing curl...'
		apt-get install -y curl
	fi

	if [ ! `which npm` ] || [ ! `which node` ]; then
		echo '>> nodejs is not installed. installing nodejs...'
		if [ ! `which lsb_release` ]; then
			apt-get install -y lsb-release
		fi
		echo "deb https://deb.nodesource.com/node_12.x `lsb_release -cs` main" > /etc/apt/sources.list.d/nodesource.list
		echo "deb-src https://deb.nodesource.com/node_12.x `lsb_release -cs` main" >> /etc/apt/sources.list.d/nodesource.list
		apt-get install -y gnupg
		curl -sSL https://deb.nodesource.com/gpgkey/nodesource.gpg.key | apt-key add -

		apt-get update && apt-get install -y nodejs
	fi

	if [ ! `which vim` ]; then
		echo '>> vim is not installed. Installing vim...'
		apt-get install -y software-properties-common
		add-apt-repository -y ppa:jonathonf/vim
		apt-get install -y vim
	fi

	if [ ! -d "$HOME/.vim/autoload/plug.vim" ]; then
		echo '>> Plug is not installed. Installing Plug...'
		curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	fi

	echo '>> Downloading vim configurations...'
	curl -sSL https://raw.githubusercontent.com/edenreich/vim-on-speeds/master/.vimrc -o $HOME/.vimrc

	vim +PlugInstall
}

install_for_macos()
{
	if [ ! vim ]; then
		echo '>> vim is not installed. Installing vim..'
		brew install vim
	fi
}


OS=`uname`
if [ "$OS" = 'Linux' ]; then
	echo '>> Installing on linux...' 
	install_for_linux
elif [ "$OS" = 'Darwin' ]; then
	echo '>> Installing on macOS...' 
	install_for_macos
fi	
