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

Plug 'vim-syntastic/syntastic'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
" coc-jedi: Python autocompletion
Plug 'pappasam/coc-jedi', { 'do': 'yarn install --frozen-lockfile && yarn build' }
Plug 'clangd/coc-clangd', { 'do': 'yarn install --frozen-lockfile && yarn build' }

" Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() } }
" If you have nodejs and yarn
Plug 'vimwiki/vimwiki' " vimwiki
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app & yarn install'  }
Plug 'jkramer/vim-checkbox'
Plug 'godlygeek/tabular' "must come before vim-markdown
Plug 'plasticboy/vim-markdown'
Plug 'masukomi/vim-markdown-folding'
Plug 'vitalk/vim-simple-todo'
Plug 'lervag/vimtex'
Plug 'mattn/emmet-vim' " HTML 5 expansion

Plug 'jmcantrell/vim-virtualenv'
" Plug 'miyakogi/vim-virtualenv'
Plug 'aperezdc/vim-template'
" Plug 'honza/vim-snippets'
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
"


" Unified color scheme (default: dark)
" }}}
" Keyboard mappings {{{
" Keyboard mappings (General) {{{
" enter spell checking mode
nnoremap <leader><leader>/ :setlocal spell! spelllang=en_gb<CR>

" <leader>v mappings:
" Turn off hilighting
nnoremap <leader>vh :nohl<CR>
" toggle conceallevel in settings
nnoremap <leader>vc :call ConcealLevelToggle()<CR>

fun! ConcealLevelToggle()
  :let &conceallevel = (&conceallevel+1)%3
endf

nnoremap <leader>vl :call AddLocalCompletion()<CR>
fun! AddLocalCompletion()
  " Add files in current directory to the completion setting
  set complete+=",s=%:r*"
endf
" Quickfix next and previous
nnoremap <leader>] :lnext<CR>
nnoremap <leader>[ :lprevious<CR>

" Force creating of file using `gf`, even if the file doesn't exist.
nnoremap g% :e <cfile><CR>

" Open in new split
nnoremap gV :belowright vsp <cfile><CR>

" }}}
" navigation VIMRC {{{

" my init.vim
nnoremap <leader>ev :vsp $MYVIMRC<CR>
nnoremap <leader>xsv :source $MYVIMRC<CR>
nnoremap <leader>sv :source $MYVIMRC<CR>

" My FT plugins
nnoremap <leader>eft :vsp ~/.config/nvim/ftplugin/<CR>

" My Python Files
nnoremap <leader>epy :vsp ~/.config/nvim/ftplugin/python_mappings.vim <CR>
" serach through vimrc files
func! SearchVimConfig(searchtext)
  exe '!ag '. a:searchtext .' ~/.config/nvim/'
endf
nnoremap <leader>esvc :redir => g:searchtext<cr>:exe ":call input('Enter search: ')"<CR>:redir END<CR>:call SearchVimConfig(g:searchtext)

" }}}
" Git {{{
nnoremap <leader>ga :Git add %<CR>
nnoremap <leader>gw :w<cr>:Git add %<CR>
nnoremap <leader>gs :Gstatus<CR>
nnoremap <leader>gc :Gcommit<CR>
" }}}
" simpleTODO {{{
nmap <leader>l <Plug>(simple-todo-new-list-item)
nmap <leader>L <Plug>(simple-todo-new-list-item-start-of-line)
" }}}
" folding {{{
set foldlevelstart=0
" Space to toggle folds
nnoremap <leader>z0 :set foldlevel=0
nnoremap <leader>z1 :set foldlevel=1
nnoremap <leader>z2 :set foldlevel=2
nnoremap <leader>z3 :set foldlevel=3
nnoremap <leader>z4 :set foldlevel=4
nnoremap <Space> za
vnoremap <Space> za
" }}}
" Copy and paste to clipboard {{{
set pastetoggle=<C-P>
" set clipboard+=unmappedplus
vnoremap  <leader>y  "+y
nnoremap  <leader>Y  "+yg_
nnoremap  <leader>y  "+y
nnoremap  <leader>yy  "+yy


" }}}
" Make {{{
nnoremap <leader>mm :make<CR>
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
" COC  {{{
" vmap <leader>p  <Plug>(coc-format-selected)
vmap <C-o> <Plug>(coc-format-selected)
" edit current file snippets
nnoremap <leader>esf :CocCommand snippets.editSnippets<CR>
nnoremap <leader>eso :CocCommand snippets.openSnippetFiles<CR>
" nnoremap <leader>eso :call CocCommand('snippets.openSnippetFiles', 'vsplit')<CR>
" <Plug>(coc-diagnostic-next) 			*n_coc-diagnostic-next*
" <Plug>(coc-diagnostic-prev) 			*n_coc-diagnostic-prev*
"
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
"
" Remap for rename current word
nmap <leader>ewr <Plug>(coc-rename)
" }}}
" WordNetwork Dictinoary / Thesaurus {{{
func! WN_overview(wrd)
  " Show the overview of the word using WordNetwork
  exe '!wn '.a:wrd.' -over'
endf
func! WN_synonyms(wrd, t)
  " Show the Synonyms of the word using WordNetwork - the available options
  " for t are:
  " n: noun
  " v: verb
  " a: adjective
  " r: ...
  exe '!wn '.a:wrd.' -syns'.a:t
endf

nnoremap <leader>do :call WN_overview(expand("<cword>"))<CR>
nnoremap <leader>dsn :call WN_synonyms(expand("<cword>"), 'n')<CR>
nnoremap <leader>dsv :call WN_synonyms(expand("<cword>"), 'v')<CR>
nnoremap <leader>dsa :call WN_synonyms(expand("<cword>"), 'a')<CR>
nnoremap <leader>dsr :call WN_synonyms(expand("<cword>"), 'r')<CR>

" }}}

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
" VimWiki {{{
let g:vimwiki_list = [{'path': '~/Documents/devices/Documents/vimwiki/',
                      \ 'syntax': 'markdown', 'ext': '.md'}]
" }}}
" Plugins and settings {{{

" nerdcommenter
let NERDSpaceDelims=1

" " Syntastic

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
" let g:syntastic_check_on_open = 1
" let g:syntastic_check_on_wq = 0

nnoremap <leader>x? :SyntasticCheck<CR>
let g:syntastic_mode_map = {
  \ "mode": "passive",
  \ "active_filetypes": ["c", "c++"],
  \ "passive_filetypes": ["python"] }


" }}}

" vim:foldmethod=marker:foldlevel=0
