set nocompatible
filetype off
set shell=/bin/bash
syntax on
set encoding=utf-8
set smartindent
set tabstop=4
set shiftwidth=4
set nu
set background=dark
color xcodedark
set bs=2
set statusline+=%F
au FileType gitcommit setlocal tw=72
augroup mail_trailing_whitespace " {
	autocmd!
	autocmd FileType mail setlocal formatoptions+=w
augroup END " }
set ignorecase
set smartcase
set hlsearch
set incsearch
set lazyredraw
set magic
set showmatch
set mat=2
set noerrorbells
set novisualbell
set t_vb=
set tm=500

set showcmd

filetype plugin on
set omnifunc=syntaxcomplete#Complete

" Return to last spot in file when reopening
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
" Except when making a commitmsg
au FileType gitcommit au! BufEnter COMMIT_EDITMSG call setpos('.', [0, 1, 1, 0])

autocmd FileType gitcommit call setpos('.', [0, 1, 1, 0])

" Nicer mappings for tag push/pop
nnoremap ö <C-t>
nnoremap ä <C-]>

function! HLNext (blinktime)
  let target_pat = '\c\%#'.@/
  let ring = matchadd('ErrorMsg', target_pat, 101)
  redraw
  exec 'sleep ' . float2nr(a:blinktime * 1000) . 'm'
  call matchdelete(ring)
  redraw
endfunction
