#/bin/bash

echo 'Starting applying config files'

if [ -f ~/.zshrc ]; then
  cp ~/.zshrc ~/.zshrc.backup.before.init
  echo 'Current ~/.zshrc has been found'
  echo 'Your ~/.zshrc saved as ~/.zshrc.backup.before.init'
  rm -f ~/.zshrc
fi

if [ -f ~/.vimrc ]; then
  cp ~/.vimrc ~/.vimrc.backup.before.init
  echo 'Current ~/.vimrc has been found'
  echo 'Your ~/.vimrc saved as ~/.vimrc.backup.before.init'
  rm -f ~/.vimrc
fi

ln -s ./.zshrc ~/.zshrc
ln -s ./.vimrc ~/.vimrc
source ~/.zshrc

echo 'Config has been applied'
echo "Don't forget to run <leader>1 or :PlugInstall in your vim"
