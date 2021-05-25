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

" Highlight search matches
set hlsearch

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Colors and Fonts
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Add colorscheme package
packadd! onedark.vim

" Enable syntax highlighting
syntax enable

" Set colorscheme
colorscheme onedark

" Set background, dis/encourage use of light coloured text
set background=light

" Set utf8 as standard encoding and en_US as the standard language
set encoding=utf8

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" =>  UI Layout
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Show absolute line number for current line
" Show relative line number for surrounding lines
set number relativenumber

augroup numbertoggle
  autocmd!
  autocmd BufEnter,WinEnter,InsertLeave,FocusGained * set relativenumber
  autocmd BufLeave,WinLeave,InsertEnter,FocusLost   * set norelativenumber
augroup END

" Enable visual autocomplete for command menu
set wildmenu

" Show matching brackets when text indicator is over them
set showmatch

" Split opening
set splitbelow
set splitright

" Show column indicator for cursor
" set cursorcolumn

" Show column marker if line gets longer than 80 chars
call matchadd('ColorColumn', '\%81v', 100)

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

filetype plugin indent on

so ~/github.com/onelharrison/dotfiles/conf/vim/plugin_config/ale.vim
so ~/github.com/onelharrison/dotfiles/conf/vim/plugin_config/coc.vim
so ~/github.com/onelharrison/dotfiles/conf/vim/plugin_config/vim-go.vim
so ~/github.com/onelharrison/dotfiles/conf/vim/plugin_config/vim-hardtime.vim
so ~/github.com/onelharrison/dotfiles/conf/vim/plugin_config/lightline.vim
