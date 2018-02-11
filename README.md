## Installation:

```git clone https://github.com/Switch168/vimrc.git ~/.vim && git clone https://github.com/VundleVim/Vundle.vim.git && ~/.vim/bundle/Vundle.vim && ln -s ~/.vim/vimrc ~/.vimrc```

open vim and type :PluginInstall

run plugin install again when a new plugin is added

## MacVim too much antialiasing
defaults write org.vim.MacVim AppleFontSmoothing -int 0  
