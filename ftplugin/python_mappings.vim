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


" vnoremap <NL> :python %<CR>
" nnoremap <NL> :!python %<CR>
nnoremap <leader>xp :w<CR>:!python %<CR>
" inoremap <C-X> <ESC>:w<CR>:!python %<CR>


let g:pyindent_open_paren = '&sw * 2'  " Default values
" set tabstop=2 shiftwidth=2 expandtab
" set list
" set lcs=tab:>-,trail:-

" nmap <silent> <leader>+ :call ToggleIndentGuidesTabs()<cr>
" nmap <silent> <leader>= :call ToggleIndentGuidesSpaces()<cr>

" function! ToggleIndentGuidesTabs()
  " if exists('b:iguides_tabs')
		" setlocal nolist
		" let &l:listchars = b:iguides_tabs
		" unlet b:iguides_tabs
	" else
		" let b:iguides_tabs = &l:listchars
		" setlocal listchars=tab:┆\ "protect the space
		" setlocal list
	" endif
" endfunction

" function! ToggleIndentGuidesSpaces()
	" if exists('b:iguides_spaces')
		" call matchdelete(b:iguides_spaces)
		" unlet b:iguides_spaces
	" else
		" let pos = range(1, &l:textwidth, &l:shiftwidth)
		" call map(pos, '"\\%" . v:val . "v"')
		" let pat = '\%(\_^\s*\)\@<=\%(' . join(pos, '\|') . '\)\s'
		" let b:iguides_spaces = matchadd('CursorLine', pat)
	" endif
" endfunction
