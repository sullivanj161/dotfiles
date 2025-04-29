echo "Downloading Vundle"
 git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
 
 echo "Installing Plugins"
  vim +PluginInstall
  
  if [ ! -d "Vundle" ]; then
    echo "Installing Vundle"
	https://github.com/VundleVim/Vundle.vim.git $HOME/.vim/bundle/Vundle.vim
	
	else
	echo "Vundle is Already installed"
fi

echo "Setup Complete"