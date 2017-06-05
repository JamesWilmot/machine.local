syntax enable

set nu
set mouse=a

set t_Co=256
let g:candy_termcolors=256  
set background=dark  
colo ir_black

let NERDTreeHijackNetrw=0

let g:NERDTreeWinPos = "right"

autocmd VimEnter * NERDTree

set autoindent
set shiftwidth=2 
set tabstop=2
set expandtab

set hlsearch

" enable per-project vim config
set exrc
set secure

set colorcolumn=80

" enable modeline
set nocompatible
filetype plugin on
set modeline
set modelines=5


" configuration for nerd commenter
let g:NERDCustomDelimiters = {
    \ 'php': { 'left': '/*', 'right': '*/', 
    \            'leftAlt': '<!--', 'rightAlt': '-->'}
    \ }

let g:NERDCustomDelimiters = {
    \ 'html': { 'leftAlt': '{{!--', 'rightAlt': '--}}', 
    \            'left': '<!--', 'right': '-->'}
    \ }

" 
au BufNewFile,BufRead *.tpl.php set ft=html
au BufNewFile,BufRead *.mustache set ft=html
au BufNewFile,BufRead *.hbs set ft=html
au BufNewFile,BufRead *.ino set ft=c
au BufNewFile,BufRead *.markdown set tw=79


" remapping that pesky escape key
inoremap jj <ESC>

" generate doc comment template
map <LocalLeader>cr :call GenerateDOCComment()<cr>

function! GenerateDOCComment()
  let l    = line('.')
  let i    = indent(l)
  let pre  = repeat(' ',i)
  let text = getline(l)
  let params   = matchstr(text,'([^)]*)')
  let paramPat = '\([$a-zA-Z_0-9]\+\)[, ]*\(.*\)'
  echomsg params
  let vars = []
  let m    = ' '
  let ml = matchlist(params,paramPat)
  while ml!=[]
    let [_,var;rest]= ml
    let vars += [pre.' * @param '.var]
    let ml = matchlist(rest,paramPat,0)
  endwhile
  let comment = [pre.'/**',pre.' * '] + vars + [pre.' */']
  call append(l-1,comment)
  call cursor(l+1,i+3)
endfunction
