"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Syntastic configs
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" JavaScript
let g:syntastic_javascript_checkers = ['eslint']

" C++
let g:syntastic_cpp_compiler = 'g++'
let g:syntastic_cpp_checkers = ['gcc']

" Python
let g:syntastic_python_checkers = ['flake8', 'bandit', 'pydocstyle', 'mypy']
