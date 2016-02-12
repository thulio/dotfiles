set nocompatible               " be iMproved
filetype off                   " required!

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle
" required!
Plugin 'gmarik/vundle'
Plugin 'kien/ctrlp.vim'
Plugin 'klen/python-mode'
Plugin 'nvie/vim-flake8'
Plugin 'majutsushi/tagbar'
Plugin 'scrooloose/nerdtree'
Plugin 'altercation/vim-colors-solarized'
Plugin 'tpope/vim-fugitive'
Plugin 'scrooloose/syntastic'
Plugin 'bling/vim-airline'
Plugin 'elixir-lang/vim-elixir'
Plugin 'mattreduce/vim-mix'
Plugin 'tpope/vim-surround'
Plugin 'ctags.vim'
Plugin 'jscappini/material.vim'
Plugin 'vim-airline/vim-airline-themes'
call vundle#end()


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

"if !has("gui_running")
"    let g:solarized_termtrans=1
"endif
"set background=dark
colorscheme material

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

set guifont=Menlo:h14

" NERDTree
noremap <Leader>n :NERDTreeToggle<CR>

" Ignore long lines error
let g:pep8_ignore="E501,W601"
let g:flake8_ignore="E501"

" airline
let g:airline_symbols = {}
let g:airline_solarized_bg='dark'
let g:airline_theme='solarized'
"let g:airline_left_sep = '»'
let g:airline_left_sep = '▶'
"let g:airline_right_sep = '«'
let g:airline_right_sep = '◀'
"let g:airline_linecolumn_prefix = '␊ '
let g:airline_symbols.linenr = '␤ '
"let g:airline_linecolumn_prefix = '¶ '
let g:airline_symbols.branch = '⎇ '
let g:airline_symbols.paste = 'ρ'

"let g:airline_paste_symbol = 'Þ'
"let g:airline_paste_symbol = '∥'

let g:airline#extensions#syntastic#enabled =1
let g:airline#extensions#branch#enabled =1

" Move Backup Files to ~/.vim/sessions
set backupdir=~/.vim/sessions
set dir=~/.vim/sessions

" No annoying sound on errors
set noerrorbells
set novisualbell
set t_vb=
set tm=500

" Show matching brackets when text indicator is over them
set showmatch
" How many tenths of a second to blink when matching brackets
set mat=2

" Markdown support
autocmd BufNewFile,BufReadPost *.md,*.markdown set filetype=markdown
autocmd FileType markdown set tw=80

let g:tagbar_autofocus = 0

