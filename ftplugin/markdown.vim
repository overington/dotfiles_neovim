" Surround with *
" autocmd FileType markdown,octopress
let b:surround_{char2nr('i')} = "*\r*"
" Surround with **
" autocmd FileType markdown,octopress 
let b:surround_{char2nr('b')} = "**\r**"

let $HERE=getcwd()
set path+=,,$HERE/assets
set include=^include(\{{\zs(*.\)\ze}})
" default ^\s*#\s*include
" set includeexpr=substitute(v:fname,'\\.','/','g')


" MarkdownPreview settings
let b:mkdp_preview_options = {
    \ 'mkit': {},
    \ 'katex': { 'delimiters': ({'left': '\[', 'right': '\]', 'display': 'true'} ) },
    \ 'uml': {},
    \ 'maid': {},
    \ 'disable_sync_scroll': 0,
    \ 'sync_scroll_type': 'middle',
    \ 'hide_yaml_meta': 1,
    \ 'sequence_diagrams': {}
    \ }


" use a custom port to start server or random for empty
" let g:mkdp_open_to_the_world = 1
" let g:mkdp_open_ip = '127.0.0.1' " change to you vps or vm ip
" let g:mkdp_port = 8889
function! g:EchoUrl(url)
    ! echo url
endfunction
" let g:mkdp_browserfunc = '' " 'g:EchoUrl'
let g_mkdp_echo_preview_url = 1
nmap <Leader>md <Plug>MarkdownPreview
nmap <Leader>ms <Plug>MarkdownPreviewStop
nmap <leader><Leader>m <Plug>MarkdownPreviewToggle

func! WordProcessor()
  " movement changes
  map j gj
  map k gk
  " formatting text
  setlocal formatoptions=1
  setlocal noexpandtab
  setlocal wrap
  setlocal linebreak
  " spelling and thesaurus
  setlocal spell spelllang=en_us
  " set thesaurus+= ~/.config/nvim/thesaurus/mthesaur.txt
  " complete+=s makes autocompletion search the thesaurus
  set complete+=s
endfu
com! WP call WordProcessor()

