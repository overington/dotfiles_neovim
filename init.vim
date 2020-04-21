" Plugins {{{

" '~/.config/nvim/ftplugin/'
"
call plug#begin('~/.config/nvim/plugged')

Plug 'glacambre/firenvim', { 'do': { _ -> firenvim#install(0) } }
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-fugitive'
"
" Plug 'flazz/vim-colorschemes'  " A bunch of ColourSchemes
" Plug 'dylanaraps/wal.vim'
" Plug 'phanviet/vim-monokai-pro'
" Plug 'junegunn/seoul256.vim'
Plug 'sonph/onehalf', {'rtp': 'vim/'}  " Colourscheme
Plug 'felixhummel/setcolors.vim'

" Plug 'vim-syntastic/syntastic'
Plug 'davidhalter/jedi-vim' " Python autocompletion
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() } }
" If you have nodejs and yarn
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app & yarn install'  }
Plug 'jkramer/vim-checkbox'
Plug 'godlygeek/tabular' "must come before vim-markdown
Plug 'plasticboy/vim-markdown'
Plug 'masukomi/vim-markdown-folding'
Plug 'vitalk/vim-simple-todo'
Plug 'lervag/vimtex'

Plug 'jmcantrell/vim-virtualenv'
" Plug 'miyakogi/vim-virtualenv'
Plug 'aperezdc/vim-template'
Plug 'honza/vim-snippets'
Plug 'sheerun/vim-polyglot'
Plug 'tpope/vim-surround'
Plug 'scrooloose/nerdcommenter'
Plug 'thaerkh/vim-indentguides'
" Plug 'Yggdroot/indentLine'

" Plug 'wsdjeg/vim-todo'

call plug#end()

filetype plugin on
filetype indent on

" }}}

" Look and feel of vim {{{ 
"

let g:polyglot_disabled = ['latex']
let mapleader = ","
let maplocalleader = "`"
set number
nmap <leader><leader>/ :setlocal spell! spelllang=en_gb<CR>

" folding {{{
set foldlevelstart=0
" Space to toggle folds
nnoremap <Space> za
vnoremap <Space> za
" }}}
" Statusline {{{
set statusline^=%{coc#status()}
" set statusline+=(%{$VIRTUAL_ENV})
" }}}
" Colorscheme {{{
" colorscheme elflord
" set termguicolors
" hi Conceal ctermbg=none
" colorscheme wal
syntax on
set t_Co=256
set cursorline
colorscheme onehalfdark
" let g:airline_theme='onehalfdark'
" }}}
" Indentation {{{
" https://vim.fandom.com/wiki/Indenting_source_code
" Using spaces instead of tabs everywhere, with a tab size of 2.
" Python tabs are described further down
set expandtab
set shiftwidth=2
set softtabstop=2
" }}}
" netrw preference {{{

" =0: re-using the same window  (default)
" =1: horizontally splitting the window first
" =2: vertically   splitting the window first
" =3: open file in new tab
" =4: act like "P" (ie. open previous window)
let g:netrw_browse_split=4
let t:netrw_toggle=0
function! ToggleNetrwBrowser()
  :topleft 40vsp %:p:h
endf
nnoremap <C-\> :call ToggleNetrwBrowser()<cr>

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
" simpleTODO {{{
nmap <leader>l <Plug>(simple-todo-new-list-item)
nmap <leader>L <Plug>(simple-todo-new-list-item-start-of-line)
" }}}



" Unified color scheme (default: dark)


" Quickfix next and previous
nmap <leader>] :lnext<CR>
nmap <leader>[ :lprevious<CR>

" Force creating of file using `gf`, even if the file doesn't exist.
" Open in new split
nmap g% :e <cfile><CR>
" :map gf :e <cfile><CR>
" :map gF :vsp ++splitright=true <cfile><CR>
nmap gV :belowright vsp <cfile><CR>


" }}}

" Language Specific {{{

" JSON  {{{
" Corrects the hilighting in JSONC files - so that comments work
autocmd FileType json syntax match Comment +\/\/.\+$+
" }}}
" python global settings {{{
"python with virtualenv support
let g:python3_host_prog = '/Users/samuel/.virtualenvs/neovim/bin/python3'
let g:python_host_prog = '/Users/samuel/.virtualenvs/neovim/bin/python'
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
