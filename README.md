## First install  
git submodule add https://github.com/tpope/vim-rails.git bundle/vim-rails  
git submodule add https://github.com/tpope/vim-haml.git bundle/vim-haml  
git submodule add https://github.com/tpope/vim-surround.git bundle/vim-surround  
git submodule add https://github.com/tpope/vim-vividchalk.git bundle/vim-vividchalk  
git submodule add https://github.com/godlygeek/tabular.git bundle/tabular  
git submodule add https://github.com/vim-scripts/repmo.vim.git bundle/repmo.vim  
git submodule add https://github.com/scrooloose/nerdtree.git bundle/nerdtree  
git submodule add git://git.wincent.com/command-t.git bundle/command-t
git submodule add https://github.com/kchmck/vim-coffee-script.git bundle/vim-coffee-script
git submodule add https://github.com/ervandew/supertab.git bundle/supertab
git submodule add https://github.com/NathanNeff/grails-vim.git bundle/grails-vim

## Deploy on new computers  
cd ~  
git clone https://github.com/vikas-reddy/dotvim.git ~/.vim  
ln -s ~/.vim/vimrc ~/.vimrc  
cd ~/.vim  
git submodule init  
git submodule update  
