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
 set number 	" show line numbers
 set ruler 	" show ruler
 set title 	" show title
 set showcmd 	" show commands until writing.
 set showmatch 	" move between ( and )
 set autoindent " insert indent when put Enter-key (if, for, etc...)
 set wildmenu 	" show list after inserting words.
 set noswapfile " Dont generate Swap file.
 set cursorline " cursor line 
"set nocursorcolumn
" Temporary files directory
 set directory=~/.vim/swap
 set backupdir=~/.vim/tmp
 set undodir=~/.vim/undo


 highlight LineNr ctermfg=darkyellow
"-------------------------------------------------------------
"	Vim Keymap Setting
"-------------------------------------------------------------
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
"	Yutori like
"----------------------------------------------------------
set nocompatible
set whichwrap=b,s,h,l,<,>,[,]
set backspace=indent,eol,start
"-----------------------------------------------------------
"	Highlight coler change
"-----------------------------------------------------------
"
highlight Comment ctermfg=lightblue

"-----------------------------------------------------------
"	FileType setting
"-----------------------------------------------------------
"autocmd BufRead,BufNewFile *.f setfiletype fortran
"autocmd BufRead,BufNewFile *.sh setfiletype shell
autocmd BufRead,BufNewFile *.zsh setfiletype zsh

"-----------------------------------------------------------
"	Plugin Manager
"-----------------------------------------------------------

call plug#begin()
  Plug 'preservim/nerdtree'	"Tree type directory
  Plug 'neoclide/coc.nvim', {'branch': 'release'}
call plug#end()


" Plugin Keymap
nnoremap <C-n> :NERDTree<CR>

"
"	For Fortran 
"
" call plug#begin('~/.vim/plugged')
"   Plug 'prabirshrestha/asyncomplete.vim'
"   Plug 'prabirshrestha/asyncomplete-lsp.vim'
"   Plug 'prabirshrestha/vim-lsp'
"   Plug 'mattn/vim-lsp-settings'
"   Plug 'mattn/vim-lsp-icons'
" call plug#end()
" let g:lsp_diagnostics_enabled=1
" "下記は好みによって設定変更すること
" let g:lsp_diagnostics_echo_cursor=1
" let g:lsp_text_edit_enabled=1
" let g:asyncomplete_auto_popup=1
" let g:asyncomplete_popup_delay=200

