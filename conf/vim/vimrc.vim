"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => General
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Sets how many lines of history VIM has to remember
set history=500

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Search
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Ignore case when searching
set ignorecase

" Search as characters are entereds
set incsearch

" Highlight seach matches
set hlsearch

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Colors and Fonts
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Enable syntax highlighting
syntax enable 

" Set dark background, encourage use of light coloured text
set background=dark

" Enable material-monokai colour scheme
" colorscheme material-monokai

" Set utf8 as standard encoding and en_US as the standard language
set encoding=utf8

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" =>  UI Layout
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Show line numbers
set number

" Enable visual autocomplete for command menu
set wildmenu

" Show matching brackets when text indicator is over them
set showmatch

" Split opening
set splitbelow
set splitright

" Show column indicator for cursor
set cursorcolumn

" Show column at column 80
set colorcolumn=80

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Navigation
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Remap VIM 0 to first non-blank character
map 0 ^

" Split navigation
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Plugin config
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

so ~/github.com/onelharrison/dotfiles/conf/vim/plugin_config/syntastic.vim
so ~/github.com/onelharrison/dotfiles/conf/vim/plugin_config/prettier.vim
