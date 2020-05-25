""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" ALE configs
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Configure error messages
"
let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'

" Linters
" =======
"
" Python
" - pylint (default: enabled)
" - bandit (default: enabled)
" - mypy   (default: enabled)
" - flake8
" - pydocstyle
"
" JavaScript
" - eslint (default: enabled)
"
let g:ale_linters = {
\   'python': ['pylint', 'bandit', 'mypy'],
\   'javascript': ['eslint']
\}

" Fixers
" ======
"
" Python
" - black (default: enabled)
" - isort (default: enabled)
"
" JavaScript
" - eslint (default: enabled)
"
let g:ale_fixers = {
\   '*': ['remove_trailing_lines', 'trim_whitespace'],
\   'python': ['black', 'isort'],
\   'javascript': ['eslint', 'prettier']
\}

let g:ale_fix_on_save = 1
