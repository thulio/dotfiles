set nornu

let g:spacevim_custom_plugins = [
 \ ['slashmili/alchemist.vim', {'on_ft': 'elixir'}],
 \ ['dracula/vim'],
 \ ['godlygeek/csapprox'],
 \ ['Shutnik/jshint2.vim', {'on_ft': ['javascript']}],
 \ ['junegunn/limelight.vim'],
 \ ['tpope/vim-fireplace', {'on_ft': ['clojure', 'clojurescript']}],
 \ ['tpope/vim-classpath', {'on_ft': ['clojure', 'java', 'scala', 'clojurescript']}],
 \ ['venantius/vim-eastwood', {'on_ft': ['clojure']}],
 \ ['venantius/vim-cljfmt', {'on_ft': ['clojure']}],
 \ ]

"let g:spacevim_colorscheme    = 'onedark'
let g:spacevim_colorscheme    = 'dracula'

set guifont=Hack\ 12

let g:python_host_prog = '~/.pyenv/versions/2.7.13/bin/python'
let g:python3_host_prog = '~/.pyenv/versions/3.6.0/bin/python'
let jshint2_save = 1

au Filetype clojure nmap <c-c><c-k> :Require<cr>

function! TestToplevel() abort
    "Eval the toplevel clojure form (a deftest) and then test-var the result."
    normal! ^
    let line1 = searchpair('(','',')', 'bcrn', g:fireplace#skip)
    let line2 = searchpair('(','',')', 'rn', g:fireplace#skip)
    let expr = join(getline(line1, line2), "\n")
    let var = fireplace#session_eval(expr)
    let result = fireplace#echo_session_eval("(clojure.test/test-var " . var . ")")
    return result
endfunction
au Filetype clojure nmap <c-c><c-t> :call TestToplevel()<cr>
