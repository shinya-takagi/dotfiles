"-----------------------------------------------------------
"	FileType setting
"-----------------------------------------------------------
"autocmd BufRead,BufNewFile *.f setfiletype fortran
"autocmd BufRead,BufNewFile *.f90 setfiletype fortran90
"autocmd BufRead,BufNewFile *.sh setfiletype shell
autocmd BufRead,BufNewFile *.zsh setfiletype zsh
autocmd BufRead,BufNewFile *.conf setfiletype json
"-----------------------------------------------
"		vim command
"-----------------------------------------------
" Background color
"set background=dark
set background=light
" File encoding of th word code.
set encoding=utf-8
set fileencodings=iso-2022-jp,sjis,uft-8
scriptencoding utf-8
filetype plugin indent on
syntax on
set number   	" show line numbers
set ruler 	    " show ruler
set title 	    " show title
set showcmd 	  " show commands until writing.
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
" Completement shows in one word, don't insert comp word.
set completeopt=menuone,noinsert	
set incsearch  " Realtime highlight search.
set hlsearch   " Highlight when you searched.
set nocompatible " No compatible with vi editor.
set whichwrap=b,s,h,l,<,>,[,]
set backspace=indent,eol,start " Backspace is"
set ttimeoutlen=50   " Timeout length
"-------------------------------------------------------------
"	Vim Keymapping
"-------------------------------------------------------------
"Disable Arrow-keys 
 noremap <Up> <Nop>
 noremap <Down> <Nop>
 noremap <Left> <Nop>
 noremap <Right> <Nop>
" jj to escape key 
 inoremap jj <Esc>  
" C-h is backspace. Delete to backspace
 noremap  <C-h>
 inoremap  <C-h>
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
"
" -------Highlight----------------->
 highlight LineNr ctermfg=darkyellow
"highlight LineNr ctermfg=yellow
"highlight Comment ctermfg=lightblue
" -------Highlight-----------<
"
" -------Abbreviations-------------->
iabbrev ad advertisement 
" Comment for vim
iab "-> "------------------------------------------------->
iab "-< "-------------------< 
" Comment for FORTRAN
iab C-> C------------------------------------------------->
iab C-< C-------------------< 
" Comment for Fortran
iab !-> !------------------------------------------------->
iab !-< !-------------------< 
" Comment for shell, python
iab #-> #------------------------------------------------->
iab #-< #-------------------< 
" Environmental shebang
iab SHEBANG #!/usr/bin/env
" --------------------------<
" -------Colorscheme---------------->
"colorscheme ThemerVim_1 
"colorscheme ThemerVim    " Original colorscheme
" --------------------<

"-----------------------------------------------------------
"	Plugin Manager
"-----------------------------------------------------------
" Define 'is_plugged' function.
function s:is_plugged(name)
    if exists('g:plugs') && has_key(g:plugs, a:name) && isdirectory(g:plugs[a:name].dir)
        return 1
    else
        return 0
    endif
endfunction

call plug#begin()
  Plug 'preservim/nerdtree'				"Tree type directory
  Plug 'neoclide/coc.nvim', {'branch': 'release'} " completement plugin.
" Plug 'romkatv/powerlevel10k'				"Use powerlevel10k, but it cannot run
  Plug 'vim-airline/vim-airline'			"Powerline fonts for Vim 
  Plug 'vim-airline/vim-airline-themes'			"For Airline themes
  Plug 'ryanoasis/vim-devicons'				"Various icons for Vim.
  Plug 'markonm/traces.vim'				"Show Hightlight for search.
  Plug 'vimwiki/vimwiki'
  Plug 'sheerun/vim-polyglot'				"Many syntax highlight with vanilla vim which don't have them.
	Plug 'JuliaEditorSupport/julia-vim'
call plug#end()
"------ vim-airline commands ----------------->
if s:is_plugged("vim-airline")
	let g:airline_powerline_fonts = 1		"Use Powerline fonts
	let g:airline#extensions#tabline#enabled = 1	"Show tab line at opening files
	let g:airline_theme = 'powerlineish'		"Change Airline color theme
	if !exists('g:airline_symbols')
		let g:airline_symbols = {}
	endif
	"let g:airline_left_sep = '⮀'			"Separeter for left
	"let g:airline_left_alt_sep = '⮁'
	"let g:airline_right_sep = '⮂'			"Separater for right
	"let g:airline_right_alt_sep = '⮃'
	let g:airline_symbols.crypt = '🔒'		"暗号化されたファイル
"let g:airline_symbols.linenr = '¶'		"行
	let g:airline_symbols.linenr = 'LINE'		"行
	let g:airline_symbols.maxlinenr = 'MAX㏑'	"最大行
	let g:airline_symbols.branch = '⭠'		"gitブランチ
	let g:airline_symbols.paste = 'ρ'		"ペーストモード
	let g:airline_symbols.spell = 'Ꞩ'		"スペルチェック
	let g:airline_symbols.notexists = '∄'		"gitで管理されていない場合
	let g:airline_symbols.whitespace = 'Ξ' 		"空白の警告(余分な空白など)
endif
" Plugin Keymap
nnoremap <C-n> :NERDTree<CR>
"-------------------------------------<
"     LSP Plugin
"-------------------------------------<
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
"--------------------------------<
