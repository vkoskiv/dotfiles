" call plug#begin('~/.vim/plugged')

" Plug 'junegunn/fzf', {'do': { -> fzf#install() } }
" Plug 'junegunn/fzf.vim'

" call plug#end()

" source $VIMRUNTIME/defaults.vim

set nocompatible
syntax on
set smartindent
set noexpandtab
set tabstop=4
set shiftwidth=4
set nu
" color desert
set bs=2
set statusline+=%F
" line-wrap properly at 72 when writing a commit msg
au FileType gitcommit setlocal tw=72

" Ignore case when searching
set ignorecase
" Try to be smart about case (unsure what this does)
set smartcase
" Highlight search results
set hlsearch
" Makes search act like search in modern browsers
set incsearch 
" Don't redraw while executing macros (good performance config)
set lazyredraw 
" For regular expressions turn magic on
set magic
" Show matching brackets when text indicator is over them
set showmatch 
" How many tenths of a second to blink when matching brackets
set mat=2

" No annoying sound on errors
set noerrorbells
set novisualbell
set t_vb=
set tm=500

" Return to last edit position when opening files (You want this!)
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

" ...Except when editing a commit message
au FileType gitcommit au! BufEnter COMMIT_EDITMSG call setpos('.', [0, 1, 1, 0])

" Fix bug where sometimes vim misplaces cursor when editing a new commit msg
autocmd FileType gitcommit call setpos('.', [0, 1, 1, 0])

" Highlight the cursor line after a jump
function s:Cursor_Moved()
	let cur_pos = winline()
	if g:last_pos == 0
		set cul
		let g:last_pos = cur_pos
		return
	endif
	let diff = g:last_pos - cur_pos
	if diff > 1 || diff < -1
		set cul
	else
		set nocul
	endif
	let g:last_pos = cur_pos
endfunction
autocmd CursorMoved,CursorMovedI * call s:Cursor_Moved()
let g:last_pos = 0


" Make tag jumping nicer
command! MakeTags !ctags -R .
nnoremap ö <c-T>
nnoremap ä <c-]>
nnoremap <c-A> 0
nnoremap <c-E> $

" Custom snippets

nnoremap ,cskel :-1read $HOME/.vim/.skeleton.c<CR>:set ft=c<CR>3jA

" Make the default file editor netrw suck less
let g:netrw_banner=0		" Disable the useless banner
let g:netrw_borwse_split=4  " Open in prior window
let g:netrw_altv=1          " Split to the right
let g:netrw_liststyle=3     " Tree view
let g:netrw_list_hide=netrw_gitignore#Hide()
" let g_netrw_list_hide.=',\(^\|\s\s)\zs\.\S\+'
