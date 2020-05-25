let g:coc_config_home = "~/github.com/onelharrison/dotfiles/conf/coc/"
let g:coc_data_home = "~/github.com/onelharrison/dotfiles/conf/coc/"

" Explorer
nmap <space>e :CocCommand explorer<CR>
nmap <space>f :CocCommand explorer --preset floating<CR>
" close coc-explorer if it's the only remaining buffer
autocmd BufEnter * if (winnr("$") == 1 && &filetype == 'coc-explorer') | q | endif
