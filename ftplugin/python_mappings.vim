let g:python_config = "~/.config/nvim/ftplugin/python_mappings.vim"

" syntax --- {{{
set textwidth=88
set colorcolumn=88,110
" }}}

nnoremap <leader>efp :exe ':vsp 'g:python_config<cr>
" nnoremap <leader>vp :python.venvPath = $WORKON_HOME + "/bin/python"
nnoremap <leader>vp :python.venvPath = %{$VIRTUAL_ENV} . "/bin/python"
nnoremap <buffer> H :<C-u>execute "!pydoc3 " . expand("<cword>")<CR>

" Select in python method - eg np.ar*ray() will select [np.array]()
" Needs a little bit more work - as if there is no '()' at the end of the end,
" it will not work
" select all in current method
nnoremap vim t(m"T v`"
" nnoremap <S-;> <S-V>""y<CR> :!pydoc3 <C-r>0<CR>
nnoremap <C-j> :!pydoc3 <cword><CR>
" Execute script
vnoremap <leader>xc ""y :python3 <C-r>0<CR>
" vnoremap 


nnoremap <leader>xp :w<CR>:!python %<CR>


let g:pyindent_open_paren = '&sw * 2'  " Default values

" Navigate to next/previous function / class
nnoremap ]n /^ *def <cr>
nnoremap ]N /^ *class <cr>
nnoremap [n ?^ *def <cr>
nnoremap [N ?^ *class <cr>

" vim:foldmethod=marker:foldlevel=0
