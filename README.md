The .vimrc is setup to use vundle, so you should just need to 

`git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim`

Then inside vim call

`:PluginInstall`

After they all install, you need to do this to get YouCompleteMe working

sudo install automake gcc gcc-c++ kernel-devel cmake make python-devel python3-devel

cd ~/.vim/bundle/YouCompleteMe
python2.7 ./install.py
