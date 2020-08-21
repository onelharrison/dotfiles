let g:coc_disable_startup_warning = 1

let g:coc_config_home = "~/github.com/onelharrison/dotfiles/conf/coc/"
let g:coc_data_home = "~/github.com/onelharrison/dotfiles/conf/coc/"

" Explorer
nmap <space>e :CocCommand explorer<CR>
nmap <space>f :CocCommand explorer --preset floating<CR>
" close coc-explorer if it's the only remaining buffer
autocmd BufEnter * if (winnr("$") == 1 && &filetype == 'coc-explorer') | q | endif

" Remap completions to use tabs
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

" Remap completion selection to <cr>
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
