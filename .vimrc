" set japanese?
set encoding=utf-8
set fileencodings=iso-2022-jp,sjis,uft-8
scriptencoding utf-8
filetype plugin indent on
syntax on

"colorscheme codedark

"-----------------------------------------------
"		vim command
"-----------------------------------------------
" show line numbers
set number
" show ruler
 set ruler
" show title
 set title
" show commands until writing.
 set showcmd
" move between ( and )
 set showmatch
" insert indent when put Enter-key (if, for, etc...)
 set autoindent
" show list after inserting words.
 set wildmenu
" Dont generate Swap file.
 set noswapfile
" cursor line 
 set cursorline
"set nocursorcolumn

 highlight LineNr ctermfg=darkyellow
" visual mode test
"noremap <C-v> <C-q>
"Disable Arrow-keys 
 noremap <Up> <Nop>
 noremap <Down> <Nop>
 noremap <Left> <Nop>
 noremap <Right> <Nop>
"inoremap <Up> <Nop>
"inoremap <Down> <Nop>
"inoremap <Left> <Nop>
"inoremap <Right> <Nop>
" In insert-mode, Need push controll-key to move.
" C-h is backspace, so arrow-keys are only disabled normal-mode.
"inoremap <C-j> <Down>
"inoremap <C-k> <Up>
"inoremap <C-h> <Left>
"inoremap <C-l> <Right>
"Delete to backspace
 noremap  <C-h>
 inoremap  <C-h>
"-------------------------------------------------
"
"----------------------------------------------------------
"" PASTE FROM CLIPBOARD
"----------------------------------------------------------
" disable indent when you paste it from clipboard in insert mode. 
"
if &term =~ "xterm"
	let &t_SI .= "\e[?2004h"
	let &t_EI .= "\e[?2004l"
	let &pastetoggle = "\e[201~"

	function XTermPasteBegin(ret)
	set paste
	return a:ret
	endfunction

	inoremap <special> <expr> <Esc>[200~ XTermPasteBegin("")
endif
"----------------------------------------------------------
"
"	Yutori like
"
"----------------------------------------------------------
set nocompatible
set whichwrap=b,s,h,l,<,>,[,]
set backspace=indent,eol,start
"-----------------------------------------------------------
"
"	Highlight coler change
"	
"-----------------------------------------------------------
"
highlight Comment ctermfg=lightblue

"-----------------------------------------------------------
"
"	FileType setting
"
"-----------------------------------------------------------
"autocmd BufRead,BufNewFile *.f setfiletype fortran
"autocmd BufRead,BufNewFile *.sh setfiletype shell
autocmd BufRead,BufNewFile *.zsh setfiletype zsh

"-----------------------------------------------------------
"
"	Plugin Manager
"
"-----------------------------------------------------------

call plug#begin()
  Plug 'preservim/nerdtree'
call plug#end()

" Plugin Keymap
nnoremap <C-n> :NERDTree<CR>

