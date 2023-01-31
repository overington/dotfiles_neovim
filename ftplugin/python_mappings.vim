let g:python_config = "~/.config/nvim/ftplugin/python_mappings.vim"

" syntax --- {{{
" set textwidth=88
" set colorcolumn=88,110
" }}}

nnoremap <leader>efp :exe ':vsp 'g:python_config<cr>

nnoremap <buffer> H :<C-u>execute "!pydoc3 " . expand("<cword>")<CR>
nnoremap <C-j> :!pydoc3 <cword><CR>
" Execute script
vnoremap <leader>xc ""y :python3 <C-r>0<CR>
" vnoremap 
