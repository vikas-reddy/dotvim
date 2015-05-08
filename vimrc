" Vikas Reddy vimrc
"

" Pathogen first
call pathogen#infect()
"call pathogen#helptags()
"let g:pathogen_disabled = ["color_picker"]


" GENERAL SETTINGS
set nocompatible                     " Vi compatibility
set incsearch hlsearch               " Incremental Search, Highlight Search
set ignorecase smartcase             " Smart Case while searching
set laststatus=1                     " Status line @ bottom
set showmatch                        " Show matching braces
set title                            " Terminal title
set noerrorbells                     " No error bells
set ruler                            " Row and Column Numbers
set pastetoggle=<F2>                 " Paste toggle
set background=dark                  " Set background as dark. Other options: light
set backspace=indent,eol,start       " To make backspace work in OSX
set nobackup                         " Create backup (filename~) files in a given directory
set shiftwidth=2 tabstop=2 expandtab
set wildmenu
set wildmode=full
set number
syntax on
filetype indent on

set wildignore+=*.o,*.out,*.obj,.git,*.rbc,*.rbo,*.class,.svn,*.gem          " Disable output and VCS files
set wildignore+=*.zip,*.tar.gz,*.tar.bz2,*.rar,*.tar.xz                      " Disable archive files
set wildignore+=*/vendor/gems/*,*/vendor/cache/*,*/.bundle/*,*/.sass-cache/* " Ignore bundler and sass cache
set wildignore+=*.swp,*~,._*                                                 " Disable temp and backup files
set wildignore+=*.png,*.gif,*.jpg,*.jpeg                                     " Ignore non-text files
set wildignore+=*/public/assets/*                                            " Ignore precompiled assets
set wildignore+=*/node_modules/*                                             " Ignore node_modules

set list
set listchars=""                  " Reset the listchars
set listchars=tab:\ \             " a tab should display as "  ", trailing whitespace as "."
set listchars+=trail:.            " show trailing spaces as dots


" Filetype syntax and indentation bindings
au BufNewFile,BufRead *.ejs set filetype=html
au BufNewFile,BufRead *.gsp set filetype=html
au FileType ruby setl shiftwidth=2 tabstop=2 expandtab
au FileType haml setl shiftwidth=2 tabstop=2 expandtab
au FileType java setl shiftwidth=3 tabstop=3 expandtab


" PLUGIN CUSTOMIZATIONS and MAPPINGS
inoremap jk <esc>

" Fugitive
nnoremap <Leader>gb :Gblame<cr>
nnoremap <Leader>gs :Gstatus<cr>
nnoremap <Leader>gd :Gdiff<cr>
nnoremap <Leader>gw :Gwrite<cr>

" edit/source vimrc
nnoremap <leader>ev :split ~/.vimrc<cr>
nnoremap <leader>sv :source ~/.vimrc<cr>

" Acking for the word under cursor
nnoremap <leader>/ :exe 'Ack -w ' . expand("<cword>") . ' app lib test'

" rails.vim customizations
autocmd User Rails Rnavcommand presenter app/presenters -default=model()

" Bufexplorer customizations
let g:bufExplorerShowRelativePath=1

" TODO: Reformat this
" Only for 256-color terminals
if &t_Co > 255
    colorscheme molokai-transparent
    " cursorline
    set t_Co=256
    hi CursorLine cterm=NONE ctermbg=235 ctermfg=NONE guibg=#222222 guifg=NONE
    " hi CursorColumn cterm=NONE ctermbg=darkred ctermfg=white guibg=darkred guifg=white
    hi CursorColumn cterm=NONE ctermbg=235 ctermfg=NONE guibg=#111111 guifg=NONE
    nnoremap <leader>cl :set cursorline!<cr>
    nnoremap <leader>cc :set cursorcolumn!<cr>
end

if has("gui_running")
    colorscheme solarized
end


""
"" General Mappings (Normal, Visual, Operator-pending)
""

" use :w!! to write to a file using sudo if you forgot to 'sudo vim file'
" (it will prompt for sudo password when writing)
cmap w!! %!sudo tee > /dev/null %

" Toggle paste mode
nmap <silent> <F4> :set invpaste<CR>:set paste?<CR>
imap <silent> <F4> <ESC>:set invpaste<CR>:set paste?<CR>

" cd to the directory containing the file in the buffer
nmap <silent> <leader>cd :lcd %:h<CR>

" Create the directory containing the file in the buffer
nmap <silent> <leader>md :!mkdir -p %:p:h<CR>

" Some helpers to edit mode
cnoremap %% <C-R>=expand('%:h').'/'<cr>

" Swap two words
nmap <silent> gw :s/\(\%#\w\+\)\(\_W\+\)\(\w\+\)/\3\2\1/<CR>`'

" Underline the current line with '='
nmap <silent> <leader>ul :t.\|s/./=/g\|:nohls<cr>

" set text wrapping toggles
nmap <silent> <leader>tw :set invwrap<CR>:set wrap?<CR>

" find merge conflict markers
nmap <silent> <leader>fc <ESC>/\v^[<=>]{7}( .*\|$)<CR>

" Map the arrow keys to be based on display lines, not physical lines
map <Down> gj
map <Up> gk

" Toggle hlsearch with <leader>hs
nmap <leader>hs :set hlsearch! hlsearch?<CR>

" Adjust viewports to the same size
map <Leader>= <C-w>=

" Fuzzy finder
map <leader>t :CtrlP<cr>
map <leader>. :CtrlPTag<cr>

" JSON format
cmap jf %!python -mjson.tool

""
"" Helpers
""

" Some file types should wrap their text
function! s:setupWrapping()
  set wrap
  set linebreak
  set textwidth=72
  set nolist
endfunction

""
"" File types
""

filetype plugin indent on " Turn on filetype plugins (:help filetype-plugin)

if has("autocmd")
  " In Makefiles, use real tabs, not tabs expanded to spaces
  au FileType make setlocal noexpandtab

  " Set the Ruby filetype for a number of common Ruby files without .rb
  au BufRead,BufNewFile {Capfile,Gemfile,Rakefile,Vagrantfile,Thorfile,Procfile,config.ru,*.rake} set ft=ruby

  " Make sure all mardown files have the correct filetype set and setup wrapping
  au BufRead,BufNewFile *.{md,markdown,mdown,mkd,mkdn,txt} setf markdown | call s:setupWrapping()

  " Treat JSON files like JavaScript
  au BufNewFile,BufRead *.json set ft=javascript

  " make Python follow PEP8 for whitespace ( http://www.python.org/dev/peps/pep-0008/ )
  au FileType python setlocal softtabstop=4 tabstop=4 shiftwidth=4

  " Remember last location in file, but not for commit messages.
  " see :help last-position-jump
  au BufReadPost * if &filetype !~ '^git\c' && line("'\"") > 0 && line("'\"") <= line("$")
    \| exe "normal! g`\"" | endif
endif

"" Plugin customizations
let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'
