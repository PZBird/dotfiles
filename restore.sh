#/bin/bash

echo 'Starting resoring config files'

if [ -f ~/.zshrc.backup.before.init ]; then
  rm -f ~/.zshrc
  cp ~/.zshrc.backup.before.init ~/.zshrc
  echo 'File ~/.zshrc has been restored'
fi

if [ -f ~/.vimrc.backup.before.init ]; then
  rm -f ~/.vimrc
  cp ~/.vimrc.backup.before.init ~/.vimrc
  echo 'File ~/.vimrc has been restored'
fi

source ~/.zshrc

echo 'Config has been restored and applied'
echo "Don't forget to run <leader>1 or :PlugInstall in your vim"
