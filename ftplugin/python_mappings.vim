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
" Execute script
vnoremap <leader>xc ""y :python3 <C-r>0<CR>
nnoremap <leader><leader>T :call TTerm(make pytest)<CR>
" vnoremap 


" vnoremap <NL> :python %<CR>
" nnoremap <NL> :!python %<CR>
nnoremap <leader>xp :w<CR>:!python %<CR>

nn <C-t>xt :TTerm make pytest<CR>
nn <C-t>xd :TTerm make debug<CR>
nn <leader>xt :terminal make pytest<CR>

nn <leader><leader>t :VTerm make pytest<CR>
nn <leader><leader>T :VTerm make pytest<CR>G
" inoremap <C-X> <ESC>:w<CR>:!python %<CR>


let g:pyindent_open_paren = '&sw * 2'  " Default values

let b:ale_linters = ['pyright', 'pylint']
