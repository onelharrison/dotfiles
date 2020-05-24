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
let g:ale_linters = {
\   'python': ['pylint', 'bandit', 'mypy'],
\}

" Fixers
" ======
"
" Python
" - black (default: enabled)
" - isort (default: enabled)
"
let g:ale_fixers = {
\   '*': ['remove_trailing_lines', 'trim_whitespace'],
\   'python': ['black', 'isort'],
\}

let g:ale_fix_on_save = 1
