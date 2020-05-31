""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" ALE configs
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Configure error messages
" ========================
let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'

" Linters
" =======
let g:ale_linters = {
\   'python': ['pylint', 'bandit', 'mypy'],
\   'javascript': ['eslint'],
\   'json': ['jsonlint'],
\   'haskell': ['hlint'],
\   'go': ['gofmt', 'golint', 'govet'],
\   'ruby': ['rubocop', 'solargraph'],
\}

" Fixers
" ======
let g:ale_fixers = {
\   '*': ['remove_trailing_lines', 'trim_whitespace'],
\   'python': ['black', 'isort'],
\   'javascript': ['eslint', 'prettier'],
\   'json': ['prettier'],
\   'haskell': ['hindent', 'stylish-haskell'],
\   'go': ['gofmt', 'goimports'],
\   'ruby': ['rubocop']
\}

let g:ale_fix_on_save = 1
