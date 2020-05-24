""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" ALE configs
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'

let g:ale_linters = {
\   'python': ['flake8', 'pydocstyle', 'bandit', 'mypy']
\}

let g:ale_fixers = {
\   '*': ['remove_trailing_lines', 'trim_whitespace'],
\   'python': ['black', 'isort']
\}

let g:ale_fix_on_save = 1
