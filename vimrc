" Vikas Reddy vimrc/exrc
"
"
"

" Vi compatibility
set nocompatible

" Jump to the last position
if has("autocmd")
  au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
    \| exe "normal! g'\"" | endif
endif

" Pathogen
call pathogen#infect()
"call pathogen#helptags()

" Set background as dark. Other options: light
set background=dark

" Turn on Syntax Highlighting
syntax on

" Incremental Search, Highlight Search
set incsearch
set hlsearch

" Smart Case while searching
set smartcase

" Status line @ bottom
set laststatus=1

" Show matching braces
set showmatch

" Terminal title
set title

" Visual beep
" set visualbell

" No error bells
set noerrorbells

" Paste toggle
set pastetoggle=<F2>

" Smart Indenting on
"set smartindent

" Filetype Indenting on
filetype indent on

" The amount to block indent when using < and >
set shiftwidth=4

" <TAB> is 4 spaces
set tabstop=4

" Expand <TAB> to spaces
set expandtab

" Uses shiftwidth instead of tabstop at start of lines
"set smarttab

" Indent whole file in command mode
" gg=G



" Compile from the Vim itself
" set makeprg=gcc\ filename.c
" :make
" Go to next error :cn
" Go to prev error :cN

" Split window horizontally
" split new OR split filename.c

" Split window vertically
" vsplit new OR vsplit filename.c


" Create backup (filename~) files in a given directory
set nobackup

" Custom commands
command -range Comment <line1>,<line2>s/^./#&/
command -range Uncomment <line1>,<line2>s/^#//

" vividchalk colorscheme
colorscheme molokai

" Filetype syntax and indentation bindings
au BufNewFile,BufRead *.ejs set filetype=html
au BufNewFile,BufRead *.gsp set filetype=html
au FileType ruby setl shiftwidth=2 tabstop=2 expandtab
au FileType haml setl shiftwidth=2 tabstop=2 expandtab

" Custom maps
" TODO: Write if (exists) for this
:nnoremap <Leader>d :Gdiff <CR>
:nnoremap <Leader>w :Gwrite <CR>

" Command-T options
let g:CommandTMaxDepth=10
let g:CommandTMaxFiles=5000
let g:CommandTMaxHeight=20
let g:CommandTMatchWindowReverse=1

" Pathogen options
"let g:pathogen_disabled = ["color_picker"]

if &t_Co > 255
    " cursorline
    set t_Co=256
    :hi CursorLine cterm=NONE ctermbg=235 ctermfg=NONE guibg=#222222 guifg=NONE
    ":hi CursorColumn cterm=NONE ctermbg=darkred ctermfg=white guibg=darkred guifg=white
    :nnoremap <Leader>c :set cursorline! <CR>
end
