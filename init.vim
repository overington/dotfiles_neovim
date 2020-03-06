" Plugins {{{

" '~/.config/nvim/ftplugin/'
"
call plug#begin('~/.config/nvim/plugged')

Plug 'glacambre/firenvim', { 'do': { _ -> firenvim#install(0) } }
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-fugitive'
Plug 'phanviet/vim-monokai-pro'
" Plug 'junegunn/seoul256.vim'

" Plug 'vim-syntastic/syntastic'
Plug 'davidhalter/jedi-vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() } }
" If you have nodejs and yarn
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app & yarn install'  }
" Plug 'godlygeek/tabular' "must come before vim-markdown
" Plug 'plasticboy/vim-markdown'

" Plug 'jmcantrell/vim-virtualenv'
" Plug 'miyakogi/vim-virtualenv'
Plug 'sheerun/vim-polyglot'
Plug 'tpope/vim-surround'
Plug 'scrooloose/nerdcommenter'
Plug 'thaerkh/vim-indentguides'
" Plug 'Yggdroot/indentLine'

Plug 'masukomi/vim-markdown-folding'
Plug 'vitalk/vim-simple-todo'
" Plug 'wsdjeg/vim-todo'

call plug#end()

filetype plugin on
filetype indent on

" }}}

" Look and feel of vim {{{ 
"
" Statusline {{{
set statusline^=%{coc#status()}
set statusline+=(%{$VIRTUAL_ENV})
" }}}
" Indentation {{{
" https://vim.fandom.com/wiki/Indenting_source_code
" Using spaces instead of tabs everywhere, with a tab size of 2.
" Python tabs are described further down
set expandtab
set shiftwidth=2
set softtabstop=2
" }}}
" snippets (coc-snippets) {{{
" Use <C-l> for trigger snippet expand.
imap <C-l> <Plug>(coc-snippets-expand)

" Use <C-j> for select text for visual placeholder of snippet.
vmap <C-j> <Plug>(coc-snippets-select)

" Use <C-j> for jump to next placeholder, it's default of coc.nvim
let g:coc_snippet_next = '<c-j>'

" Use <C-k> for jump to previous placeholder, it's default of coc.nvim
let g:coc_snippet_prev = '<c-k>'

" Use <C-j> for both expand and jump (make expand higher priority.)
imap <C-j> <Plug>(coc-snippets-expand-jump)
" }}}

" colorscheme elflord
set termguicolors
colorscheme monokai_pro
let mapleader = ","
set number
" Unified color scheme (default: dark)

" Copy and paste to clipboard {{{
set pastetoggle=<C-P>
" set clipboard+=unmappedplus
vnoremap  <leader>y  "+y
nnoremap  <leader>Y  "+yg_
nnoremap  <leader>y  "+y
nnoremap  <leader>yy  "+yy

" Paste from clipboard (paste)
nnoremap <leader>p "+p
nnoremap <leader>P "+P
vnoremap <leader>p "+p
vnoremap <leader>P "+P

" }}}

" Quickfix next and previous
:nmap <leader>] :lnext<CR>
:nmap <leader>[ :lprevious<CR>

" Force creating of file using `gf`, even if the file doesn't exist.
" Open in new split
:map g% :e <cfile><CR>
" :map gf :e <cfile><CR>
" :map gF :vsp ++splitright=true <cfile><CR>
:map gF :belowright vsp <cfile><CR>


" }}}

" Language Specific {{{

syntax on

" JSON  {{{
" Corrects the hilighting in JSONC files - so that comments work
autocmd FileType json syntax match Comment +\/\/.\+$+
" }}}
" }}}
" markdown and Pandoc {{{
" Automating the pandoc options
nnoremap <leader>PP :!pandoc --from markdown -i % ~/src/latex/frontmatter.yaml -o %.pdf; open %.pdf<CR>
" }}}
" latex {{{

" pdflatex:
nnoremap <leader>AL :!pdflatex %:r<CR>
nnoremap <leader>AA :!axohelp %:r<CR>
nnoremap <leader>AP :!open %:r.pdf<CR>
nnoremap <leader>AX :!pdflatex %:r; axohelp %:r; pdflatex %;open %:r.pdf<CR>
" luatex builds:
nnoremap <leader>LL :!lualatex %;open %:r.pdf<CR>
nnoremap <leader>Lg :!lualatex %;<CR>:spl<CR>:e %:r.log<CR>

" }}}

" Plugins and settings {{{
" COC  {{{
" vmap <leader>p  <Plug>(coc-format-selected)
nnoremap <leader>p  <Plug>(coc-format-selected)
" <Plug>(coc-diagnostic-next) 			*n_coc-diagnostic-next*
" <Plug>(coc-diagnostic-prev) 			*n_coc-diagnostic-prev*
" }}}

" nerdcommenter
let NERDSpaceDelims=1

" " Syntastic

" let g:syntastic_always_populate_loc_list = 1
" let g:syntastic_auto_loc_list = 1
" let g:syntastic_check_on_open = 1
" let g:syntastic_check_on_wq = 0


" }}}

" VIMRC {{{

" my init.vim
nnoremap <leader>ev :vsp $MYVIMRC<CR>
nnoremap <leader>sv :source $MYVIMRC<CR>

" My FT plugins
nnoremap <leader>eft :vsp ~/.config/nvim/ftplugin/<CR>

" My Python Files
nnoremap <leader>epy :vsp ~/.config/nvim/ftplugin/python_mappings.vim <CR>

" }}}

" vim:foldmethod=marker:foldlevel=0
