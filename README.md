#Deploy on new computers
cd ~
git clone https://github.com/vikas-reddy/dotvim.git ~/.vim
ln -s ~/.vim/vimrc ~/.vimrc
cd ~/.vim
git submodule init
git submodule update
