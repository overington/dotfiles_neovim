" reflow text in paragraph to max 80 chars
let g:markdown_config = expand('~') . "/.config/nvim/ftplugin/markdown.vim"
nnoremap <leader><leader>r mqgqip`q
nnoremap <leader>efm :exe ':vsp 'g:markdown_config<cr>


fun! ToggelFT()
  if &ft=="markdown"
    set filetype=tex
  else
    set filetype=markdown
  endif
endf
nnoremap <leader>ft :call ToggelFT()<CR>


" Surround with *
" autocmd FileType markdown,octopress
let b:surround_{char2nr('i')} = "*\r*"
let b:surround_{char2nr('b')} = "**\r**"
let b:surround_{char2nr('M')} = "$$\n\r\n$$"
let b:surround_{char2nr('m')} = "$\r$"
let b:surround_{char2nr('N')} = "\\[\n\r\n\\]"
let b:surround_{char2nr('n')} = "\\(\r\\)"

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
" Some latex macros to replace $$ for \begin{align}\end{align}
" /$$ccmanddmb`aV`bS\align}
" V/$$n:s/\$\$//ggvS\align

func! MY_MarkdownToHTML()
  !pandoc --from markdown --to html % | pbcopy
endfunction
com! MD2HTML call MY_MarkdownToHTML()
nmap <Leader>mh :MD2HTML<CR>

let g:proj_basedir='~/Documents/Study/2019-20/project/dissertation/' " This is the base where pandoc will run from, when looking for
let b:template=g:proj_basedir.'assets/template-eisvogel.latex'
let b:config_file=g:proj_basedir.'_conf.yaml -s'
let b:pdf_engine='lualatex'
" let b:output_dir=g:proj_basedir.'outpout/'
let b:output_dir='~/Documents/Study/2019-20/project/thesis_output/'
imap <C-r><C-g> :r exe '!echo %'



nmap <leader>sm :exe 'so 'g:markdown_config
nmap <leader>go :exe 'e ' g:proj_basedir


" Do we want to open the Pandoc File after we have compiled it?
let g:pandoc_openaftercompile=v:true
fun! PandocOpenPDF(file_name)
  echo b:output_dir. a:file_name
  exe '!open ' . b:output_dir. a:file_name
endf

fun! PandocTemplateChap(pre)
  let b:file_name = 'chapter-'. a:pre .'.pdf'
  exe '!(cd ' g:proj_basedir .
        \ ' && pandoc '.
        \ '--filter pandoc-citeproc '.
        \ '%:p:h/' . a:pre . '*.md ' . b:pan_config_file ' '.
        \ '--pdf-engine ' b:pdf_engine ' ' .
        \ '--template '. b:template .' --listings ' .
        \ '--from=markdown+tex_math_single_backslash ' .
        \ '-o ' .b:output_dir. b:file_name . ')'
  if g:pandoc_openaftercompile
    call PandocOpenPDF(b:file_name)
  endif
endf

fun! PandocTemplateAll()
  let b:file_name = 'draft-amplitudes.pdf'
  exe '!(cd ' g:proj_basedir .
        \ ' && pandoc '.
        \ '--filter pandoc-citeproc '.
        \ '%:p:h/*.md ' . b:config_file ' '.
        \ '--pdf-engine ' b:pdf_engine ' ' .
        \ '--template '. b:template .' --listings ' .
        \ '--from=markdown+tex_math_single_backslash ' .
        \ '-o ' .b:output_dir. b:file_name . ')'
  if g:pandoc_openaftercompile
    call PandocOpenPDF(b:file_name)
  endif
endf
fun! PandocTemplateFile()
  let b:file_name = '%:t:r.pdf'
  exe '!(cd ' g:proj_basedir .
        \ ' && pandoc '.
        \ '--filter pandoc-citeproc '.
        \ '%:p ' . b:config_file ' '.
        \ '--pdf-engine ' b:pdf_engine ' ' .
        \ '--template '. b:template .' --listings ' .
        \ '--from=markdown+tex_math_single_backslash ' .
        \ '-o ' .b:output_dir. b:file_name . ')'
  if g:pandoc_openaftercompile
    call PandocOpenPDF(b:file_name)
  endif
endf

com! PanOpen call PandocOpenPDF()
nmap <Leader><leader>O :PanOpen

com! PanFile call PandocTemplateFile()
nmap <Leader><leader>f :PanFile

com! PanAll call PandocTemplateAll()
nmap <Leader><leader>a :PanAll

" com! PanCh(a:chap) call PandocTemplateChap(a:chap)
nmap <Leader><leader>c :call PandocTemplateChap(2

function! MDHeadingIncrease()
  exe 'I#'
endf


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

