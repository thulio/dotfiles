set nornu

let g:spacevim_custom_plugins = [
 \ ['slashmili/alchemist.vim', {'on_ft': 'elixir'}],
 \ ['dracula/vim'],
 \ ['godlygeek/csapprox'],
 \ ['tpope/vim-fireplace', {'on_ft': ['clojure', 'clojurescript']}],
 \ ['tpope/vim-classpath', {'on_ft': ['clojure', 'java', 'scala', 'clojurescript']}],
 \ ]

"let g:spacevim_colorscheme    = 'onedark'
let g:spacevim_colorscheme    = 'dracula'

set guifont=Hack\ 12

let g:python_host_prog = '~/.pyenv/versions/2.7.13/bin/python'
let g:python3_host_prog = '~/.pyenv/versions/3.6.0/bin/python'
