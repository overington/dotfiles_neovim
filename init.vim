" Plugins {{{
let g:polyglot_disabled = ['markdown', 'latex']
"
call plug#begin('~/.config/nvim/plugged')
" UI / look and feel {{{
Plug 'tpope/vim-sensible'
Plug 'junegunn/seoul256.vim'
Plug 'felixhummel/setcolors.vim'
Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim'
Plug 'sheerun/vim-polyglot' " Language / syntax hilighting
" }}}
" Utilities {{{
Plug 'tpope/vim-fugitive'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'vimlab/split-term.vim'
Plug 'vimwiki/vimwiki'
Plug 'scrooloose/nerdcommenter'
Plug 'thaerkh/vim-indentguides'
Plug 'tpope/vim-surround'
Plug 'aperezdc/vim-template'
Plug 'vitalk/vim-simple-todo'
Plug 'jkramer/vim-checkbox'
Plug 'nvim-lua/popup.nvim'
Plug 'mattn/emmet-vim'

Plug 'mfussenegger/nvim-lint'
Plug 'mhartington/formatter.nvim'
" }}}
" LSP / Autocompletion {{{
" completion
Plug 'williamboman/mason.nvim' " to manage LSP & DAP servers, linters, and formatters.
Plug 'williamboman/mason-lspconfig.nvim' " bridge mason.nvim with the lspconfig
Plug 'neovim/nvim-lspconfig'

Plug 'hrsh7th/nvim-cmp'

Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-path'

" Snippets
Plug 'L3MON4D3/LuaSnip'
Plug 'saadparwaiz1/cmp_luasnip'

Plug 'dense-analysis/ale'
" Plug 'davidhalter/jedi-vim'
" Plug 'lifepillar/vim-mucomplete'
" set completeopt+=menuone " Mandatory for mucomplete
" }}}
" Languages {{{
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app & yarn install'  }
Plug 'godlygeek/tabular' "must come before vim-markdown
Plug 'plasticboy/vim-markdown'
Plug 'masukomi/vim-markdown-folding'
Plug 'lervag/vimtex'
" }}}
call plug#end()

filetype plugin on
filetype indent on

" }}}
" Look and feel of vim {{{ 
"
let mapleader = ","
let maplocalleader = "`"
set showmatch " show matching surround
set number
let g:nvimConfDir = $HOME . '/.config/nvim'

" Auto-update buffer to most recent version of file, when file has been edited outside current session. Specifically fixes python-black edit
au FocusGained,BufEnter * :checktim

" Statusline {{{
" set statusline^=%{coc#status()}
" set statusline+=(%{$VIRTUAL_ENV})
" }}}
" Indentation {{{
" https://vim.fandom.com/wiki/Indenting_source_code
" Using spaces instead of tabs everywhere, with a tab size of 2.
" Python tabs are described further down
set expandtab
set shiftwidth=2
set softtabstop=2
" }}}
" COC  {{{
" execute 'source '.fnameescape(join([g:nvimConfDir,  'coc-config.vim'], '/'))
" }}}
" netrw preference {{{

" =0: re-using the same window  (default)
" =1: horizontally splitting the window first
" =2: vertically   splitting the window first
" =3: open file in new tab
" =4: act like "P" (ie. open previous window)
let g:netrw_browse_split=0
let t:netrw_toggle=0

" = 0: thin listing (one file per line)
" = 1: long listing (one file per line with time stamp information and file size)
" = 2: wide listing (multiple files in columns)
" = 3: tree style listing
let g:netrw_liststyle=3
function! ToggleNetrwBrowser()
  :topleft 40vsp %:p:h
endf
nnoremap <C-\> :call ToggleNetrwBrowser()<cr>

" }}}
" Goyo / Limelight {{{
autocmd! User GoyoEnter Limelight
autocmd! User GoyoLeave Limelight!

" let g:limelight_conceal_ctermfg = 240
" }}} Goyo / Limelight
" Neoformat settings {{{
let g:neoformat_try_node_exe = 1
" }}}
"


" Unified color scheme (default: dark)
" }}}
" Keyboard mappings {{{
" General {{{

" Enter YYYY-MM-DD in insert mode
imap <C-t> <C-r>=strftime('%F')<CR>

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

" open a new tab
nnoremap <leader>tt :tabe<cr>

" Search for word in current codebase
let file_glob_expr = '**/*/*.py'

" Search 
" search for <func> in the sentence self.func()
nnoremap <leader>lw :execute('lvi /'.expand("<cword>").'/ '.file_glob_expr )<cr>

" search for self.func() in the sentence self.func() if cursor over self or func
nnoremap <leader>lW :execute('lvi /'.expand("<cWORD>").'/ '.file_glob_expr )<cr>

" search for self.func in the sentence self.func() if cursor over self or func
nnoremap <leader>lf :execute('lvi /'.expand("<cfile>").'/ '.file_glob_expr )<cr>


" }}}
" navigation VIMRC {{{

" my init.vim
nnoremap <leader>ev :vsp $MYVIMRC<CR>
nnoremap <leader>gev :e $MYVIMRC<CR>
nnoremap <leader>xsv :source $MYVIMRC<CR>
nnoremap <leader>sv :source $MYVIMRC<CR>

" My coc-config.vim file
nnoremap <leader>ecv :vsp $COC_VIMCONFIG/coc-config.vim<CR>
nnoremap <leader>ecj :vsp $COC_VIMCONFIG/coc-settings.json<CR>

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
nnoremap <leader>gs :Git<CR>
nnoremap <leader>gc :Git commit<CR>
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
set pastetoggle=<C-/>
" set clipboard+=unmappedplus
vnoremap  <leader>y  "+y
nnoremap  <leader>Y  "+yg_
nnoremap  <leader>y  "+y
nnoremap  <leader>yy  "+yy


" }}}
" Make {{{
nnoremap <leader>xm :exe 'make %:r.o && ./%:r.o'<CR>
nnoremap <leader>mm :exe 'make %:r.o && ./%:r.o'<CR>

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

" }}}
" Language Specific {{{
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
" text {{{
function! TwiddleCase(str)
  if a:str ==# toupper(a:str)
    let result = tolower(a:str)
  elseif a:str ==# tolower(a:str)
    let result = substitute(a:str,'\(\<\w\+\>\)', '\u\1', 'g')
  else
    let result = toupper(a:str)
  endif
  return result
endfunction
vnoremap ~ y:call setreg('', TwiddleCase(@"), getregtype(''))<CR>gv""Pgv
" }}}
" JSON  {{{
" Corrects the hilighting in JSONC files - so that comments work
autocmd FileType json syntax match Comment +\/\/.\+$+
" }}}
" python global settings {{{
"python with virtualenv support
if !empty($PYENV_ROOT)
  let g:python3_host_prog = '$PYENV_ROOT/versions/nvim/bin/python3'
  let g:python_host_prog =  '$PYENV_ROOT/versions/nvim/bin/python'
else
  cd $HOME/.config/nvim/
  !make install
  let g:python_host_prog3 = '/Users/soverington/.config/nvim/venv/bin/python'
  let g:python_host_prog =  '/Users/soverington/.config/nvim/venv/bin/python'
endif
" }}}
" VimWiki {{{
let g:vimwiki_list = [{'path': '$HOME/Documents/vimwiki/',
                      \ 'syntax': 'markdown', 'ext': '.md'}]
" }}}
" Colorscheme {{{
" colorscheme elflord
" set termguicolors
" hi Conceal ctermbg=none
" colorscheme wal
syntax on
set cursorline
" colorscheme onehalfdark
" set t_Co=256
let g:seoul256_background = 236
colorscheme seoul256
set background=dark

""" Customize colors
func! s:my_colors_setup() abort
    " this is an example
    hi CocCodeLens ctermfg=248 guifg=NONE

    hi Pmenu guibg=#d7e5dc gui=NONE
    hi PmenuSel guibg=#b7c7b7 gui=NONE
    hi PmenuSbar guibg=#bcbcbc
    hi PmenuThumb guibg=#585858
endfunc

" augroup colorscheme_coc_setup | au!
"     au ColorScheme * call s:my_colors_setup()
" augroup END


" }}}
" Plugins and settings {{{
nnoremap <leader>ecs :vsp $HOME/.config/nvim/lua/completion-settings.lua<CR>
luafile $HOME/.config/nvim/lua/completion-settings.lua
let g:LanguageClient_autoStart = 1
" nerdcommenter {{{
let NERDSpaceDelims=1
" }}}
" CtrlP {{{
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']
" }}}
" ale {{{

set omnifunc=ale#completion#OmniFunc
nmap <silent> <C-k> <Plug>(ale_previous_wrap)
nmap <silent> <C-j> <Plug>(ale_next_wrap)
" VimTex default flavour https://github.com/lervag/vimtex/commit/f78a0bdadbe9bccf15df855268e3e38ec8b3c7c3
let g:tex_flavor = 'latex'
let g:ale_python_auto_poetry = v:true
let g:ale_python_pylint_auto_poetry = v:true


" }}}
" }}}
" }}}
" vim:foldmethod=marker:foldlevel=0
