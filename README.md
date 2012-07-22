# First install  
git submodule add https://github.com/vim-scripts/repmo.vim.git bundle/repmo.vim/  

# Deploy on new computers  
cd ~  
git clone https://github.com/vikas-reddy/dotvim.git ~/.vim  
ln -s ~/.vim/vimrc ~/.vimrc  
cd ~/.vim  
git submodule init  
git submodule update  
