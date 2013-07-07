set nocompatible               " be iMproved
filetype off                   " required!

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
" required! 
Bundle 'gmarik/vundle'
Bundle 'kien/ctrlp.vim'
Bundle 'klen/python-mode'
Bundle 'nvie/vim-flake8'
Bundle 'majutsushi/tagbar'
Bundle 'scrooloose/nerdtree'
Bundle 'altercation/vim-colors-solarized'
Bundle 'tpope/vim-fugitive'
Bundle 'scrooloose/syntastic'
Bundle 'bling/vim-airline'


set nocompatible                " choose no compatibility with legacy vi
syntax enable
set encoding=utf-8
set showcmd                     " display incomplete commands
set number
set ruler
filetype plugin indent on       " load file type plugins + indentation

"" Whitespace
set nowrap                      " don't wrap lines
set tabstop=4 shiftwidth=4      " a tab is two spaces (or set this to 4)
set expandtab                   " use spaces, not tabs (optional)
set backspace=indent,eol,start  " backspace through everything in insert mode
set list listchars=tab:\ \ ,trail:·

"" Searching
set hlsearch                    " highlight matches
set incsearch                   " incremental searching
set ignorecase                  " searches are case insensitive...
set smartcase                   " ... unless they contain at least one capital letter

" Tab completion
set wildmode=list:longest,list:full
set wildignore+=*.o,*.obj,.git,*.rbc,*.class,.svn,vendor/gems/*

" Status bar
set laststatus=2

" Show (partial) command in the status line
set showcmd

" use comma as <Leader> key instead of backslash
" let mapleader=","

" double percentage sign in command mode is expanded
" to directory of current file - http://vimcasts.org/e/14
cnoremap %% <C-R>=expand('%:h').'/'<cr>

map <leader>t :CtrlP<cr>
map <leader>T :CtrlPBuffer<cr>

if !has("gui_running")
    let g:solarized_termtrans=1
endif
set background=dark
colorscheme solarized

" Python-mode
" Disable pylint checking every save
let g:pymode_lint_write = 0

" Set key 'R' for run python code
let g:pymode_run_key = 'R'

" Disable folding
let g:pymode_folding = 0

" Lint
" Switch pylint or pyflakes code checker
" values (pylint, pyflakes)
let g:pymode_lint_checker = "pyflakes"

" Don't let pyflakes use the quickfix window
let g:pyflakes_use_quickfix = 0
"
" " Run pyflake8
" autocmd FileType python map <Leader>8 :call Flake8()<CR>
" " Run when saving py files
autocmd BufWritePost *.py call Flake8()

" TagBar
nmap <F8> :TagbarToggle<CR>

imap <buffer><Tab> <C-Space>
vmap <C-c> "+yi
vmap <C-x> "+c
vmap <C-v> c<ESC>"+p
imap <C-v> <ESC>"+p

set guifont=Ubuntu\ Mono\ 13

" NERDTree
noremap <Leader>n :NERDTreeToggle<CR>

" Ignore long lines error
let g:pep8_ignore="E501,W601"
let g:flake8_ignore="E501"

" airline
let g:airline_theme='badwolf'
"let g:airline_left_sep = '»'
let g:airline_left_sep = '▶'
"let g:airline_right_sep = '«'
let g:airline_right_sep = '◀'
"let g:airline_linecolumn_prefix = '␊ '
let g:airline_linecolumn_prefix = '␤ '
"let g:airline_linecolumn_prefix = '¶ '
let g:airline_fugitive_prefix = '⎇ '
let g:airline_paste_symbol = 'ρ'
"let g:airline_paste_symbol = 'Þ'
"let g:airline_paste_symbol = '∥'

let g:airline_enable_syntastic=1
let g:airline_enable_fugitive=1
