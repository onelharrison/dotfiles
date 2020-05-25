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
" Haskell
" - hlint (default: enabled)
"
" Golang
" - gofmt (default: enabled)
" - golint (default: enabled)
" - govet (default: enabled)
"
let g:ale_linters = {
\   'python': ['pylint', 'bandit', 'mypy'],
\   'javascript': ['eslint'],
\   'haskell': ['hlint'],
\   'go': ['gofmt', 'golint', 'govet']
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
" - prettier (default: enabled)
"
" Haskell
" - hindent (default: enabled)
"
" Golang
" - gofmt (default: enabled)
" - goimports (default: enabled)
"
let g:ale_fixers = {
\   '*': ['remove_trailing_lines', 'trim_whitespace'],
\   'python': ['black', 'isort'],
\   'javascript': ['eslint', 'prettier'],
\   'haskell': ['hindent', 'stylish-haskell'],
\   'go': ['gofmt', 'goimports']
\}

let g:ale_fix_on_save = 1
