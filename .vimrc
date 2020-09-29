set number
setlocal formatoptions-=o
setlocal formatoptions-=r

"call plug#begin()
"Plug 'davidhalter/jedi'
"call plug#end()

colorscheme delek

"execute pathogen#infect()
"syntax on
"filetype plugin indent on

"nnoremap <slient><C-e> :NERDTreeToggle<CR>



"----------------------------------------------------------
"" PASTE FROM CLIPBOARD
"----------------------------------------------------------
" disable indent when you paste it from clipboard in insert mode. 
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
"--------------------------------------------------------


"--------------START dein SCRIPTS------------------------
if &compatible
  set nocompatible
endif
  " Add the dein installation directory into runtimepath
set runtimepath+=~/.cache/dein/repos/github.com/Shougo/dein.vim

let s:dein_path = expand('~/.cache/dein')
let s:dein_repo_path = s:dein_path . '/repos/github.com/Shougo/dein.vim'

if dein#load_state(s:dein_path)
  call dein#begin(s:dein_path)

  let g:config_dir = expand('~/.cache/userconfig')
  let s:toml	   = g:config_dir . '/plugin.toml'
  let s:lazy_toml  = g:config_dir . '/plugin_lazy.toml'

  call dein#load_toml(s:toml,		{'lazy': 0})
  call dein#load_toml(s:lazy_toml,	{'lazy': 1})

" call dein#add('~/.cache/dein/repos/github.com/Shougo/dein.vim')
" call dein#add('Shougo/deoplete.nvim')
" if !has('nvim')
"   call dein#add('roxma/nvim-yarp')
"   call dein#add('roxma/vim-hug-neovim-rpc')
" endif
"------------------------------------------------------
" add plugins
"------------------------------------------------------
" call dein#add('test/test')
" call dein#add('scrooloose/nerdtree')
" call dein#add('Yggdroot/indentLine')
" call dein#add('valloric/youcompleteme')
" call dein#add('nvie/vim-flake8')
" call dein#add('hhatto/autopep8')
"------------------------------------------------------
  call dein#end()
  call dein#save_state()
endif

filetype plugin indent on
syntax enable

if dein#check_install()
	call dein#install()
endif
"---------------END dein SCRIPTS-----------------------

"------------------------------------------------------
"	youcompletme for python
"------------------------------------------------------
let g:ycm_server_python_interpreter = '/usr/bin/python3'
let g:ycm_python_binary_path = '/usr/bin/python3'
let g:ycm_global_ycm_extra_conf = '/root/.vim/plugged/YouCompleteMe/.ycm_extra_conf.py'
let g:ycm_auto_trigger = 1
let g:ycm_min_num_of_chars_for_completion = 1
let g:ycm_autoclose_preview_window_after_insertion = 1
set completeopt-=preview
let g:ycm_add_preview_to_completeopt = 0

"------------------------------------------------------
"function! Preserve(command)
	"Save the last search.
	"let search = @/
	" Save the current cursor position.
	"let cursor_position = getpos('.')
	" Save the current window position.
	"normal! H
	"let window_position = getpos('.')
	"call setpos('.', cursor_position)
	" Execute the command.
	"execute a:command
	" Restore the last search.
	"let @/ = search
        " Restore the previous window position.
        "call setpos('.', window_position)
        "normal! zt
        " Restore the previous cursor position.
        "call setpos('.', cursor_position)
"endfunction

"function! Autopep8()
	"--ignote=E501: Ignore completing the length of a line."
"	call Preserve(':silent %!autopep8 --ignore=E501 -')
"endfunction

"augroup python_auto_lint
"	autocmd!
"	autocmd BufWrite *.py :call Autopep8()
"	autocmd BufWrite *.py :call Flake8()
"augroup END

"-------------------------------------------------
"	Auto write ()
"-------------------------------------------------
imap { {}<LEFT>
imap [ []<LEFT>
imap ( ()<LEFT>
"-------------------------------------------------
"	VIM Settings
"-------------------------------------------------
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
highlight LineNr ctermfg=darkyellow
"Disable Arrow-keys 
noremap <Up> <Nop>
noremap <Down> <Nop>
noremap <Left> <Nop>
noremap <Right> <Nop>
inoremap <Up> <Nop>
inoremap <Down> <Nop>
inoremap <Left> <Nop>
inoremap <Right> <Nop>

"In insert-mode, Need push controll-key to move.
inoremap <C-j> <Down>
inoremap <C-k> <Up>
inoremap <C-h> <Left>
inoremap <C-l> <Right>

"-------------------------------------------------

