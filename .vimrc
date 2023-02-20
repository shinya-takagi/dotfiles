" -----------------------------------------------------------
"           Debug Environment
" -----------------------------------------------------------
" Screenshot Environment
let g:for_screen_shot = 0

"-------------------------------------------------------------
"               Vim Keymap Setting
"-------------------------------------------------------------
" Leader Key
let g:mapleader = "\<Space>"

"--Disable Arrow-keys 
 noremap <Up> <Nop>
 noremap <Down> <Nop>
 noremap <Left> <Nop>
 noremap <Right> <Nop>
inoremap <Up> <Nop>
inoremap <Down> <Nop>
inoremap <Left> <Nop>
inoremap <Right> <Nop>

" In insert-mode, Need push controll-key to move.
" C-h is backspace, so arrow-keys are only disabled normal-mode.
"   Delete Backspace using Ctrl+h
inoremap <C-h> <Nop>
"   Move key to use ctrl+hjkl
inoremap <C-j> <Down>
inoremap <C-k> <Up>
inoremap <C-h> <Left>
inoremap <C-l> <Right>

" semicoron to coron on normal mode for US Keyboard
 nnoremap ; :
 set whichwrap=b,s,h,l,<,>,[,]
 set backspace=indent,eol,start
"-----------------------------------------------
"               vim command
"-----------------------------------------------
" Set about file config.
set encoding=utf-8
set fileencodings=uft-8,iso-2022-jp,sjis
scriptencoding utf-8
filetype plugin indent on
syntax on

if g:for_screen_shot == 1
    " Light color (BG:White, FG:Gray)
    set background=light
    colorscheme ThemerVim
    set laststatus=0
else
    " Dark color (BG:Black, FG:White)
    set background=dark
    colorscheme molokai
    set laststatus=2
endif

" Use aliases on bash
let $BASH_ENV = "~/.bash_aliases"
set nocompatible
set number     " show line numbers
set ruler      " show ruler
set title      " show title
set showcmd    " show commands until writing.
set showmatch  " move between ( and )
set autoindent " insert indent when put Enter-key (if, for, etc...)
set wildmenu   " show list after inserting words.
set noswapfile " Dont generate Swap file.
set cursorline " cursor line 
set incsearch  " Realtime highlight search.
set ignorecase
" set nocursorcolumn

" Temporary files directory
set directory=~/.vim/swap
set backupdir=~/.vim/tmp
" set undodir=~/.vim/undo

" Show Status Line on Vim forever.
" Set detailed status on Vim. %= is moving to right side.
set statusline=\P:\ %<%r%F\       "Show filepath
set statusline+=%y\                "Show filetype
" set statusline+=[%{expand('%:e')}] "Show file expansion
set statusline+=%=T:\ %{strftime('%p\.%H:%M:%S\ \in\ %Y/%m/%d')}, "Show Time
set statusline+=\ Col:\ %c,    "Show column number
set statusline+=\ Row:\ %l/%L/%P\   "Show line number

" Set list (Show some special characters)
" EOL : <<, TAB : >>..., TRAIL : "
exec "set listchars=eol:\uAB,tab:\uBB.,trail:_"
set list
"-----------------------------------------------------------
"           Highlight coler change
"-----------------------------------------------------------
" highlight LineNr ctermfg=darkyellow
" highlight Comment ctermfg=magenta
highlight StatusLine ctermfg=red ctermbg=black
"----------------------------------------------------------
""          PASTE FROM CLIPBOARD
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
"-----------------------------------------------------------
"               FileType setting
"-----------------------------------------------------------
augroup set_filetype
    autocmd!
    autocmd BufRead,BufNewFile *.zsh           setfiletype zsh
    autocmd BufRead,BufNewFile *.md            set filetype=markdown
    autocmd BufRead,BufNewFile *.bash          set filetype=sh
augroup end
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
" Create Shebang automatically
iab SHEBANG #!/usr/bin/env
" --------------------------<
"----------------------------------------------------------
"       For editing Colorscheme
"----------------------------------------------------------
"  get color group of syntax highlight, Development of SyntaxInfo
"    -> :SyntaxInfo
function! s:get_syn_id(transparent)
  let synid = synID(line("."), col("."), 1)
  if a:transparent
    return synIDtrans(synid)
  else
    return synid
  endif
endfunction
function! s:get_syn_attr(synid)
  let name = synIDattr(a:synid, "name")
  let ctermfg = synIDattr(a:synid, "fg", "cterm")
  let ctermbg = synIDattr(a:synid, "bg", "cterm")
  let guifg = synIDattr(a:synid, "fg", "gui")
  let guibg = synIDattr(a:synid, "bg", "gui")
  return {
        \ "name": name,
        \ "ctermfg": ctermfg,
        \ "ctermbg": ctermbg,
        \ "guifg": guifg,
        \ "guibg": guibg}
endfunction
function! s:get_syn_info()
  let baseSyn = s:get_syn_attr(s:get_syn_id(0))
  echo "name: " . baseSyn.name .
        \ " ctermfg: " . baseSyn.ctermfg .
        \ " ctermbg: " . baseSyn.ctermbg .
        \ " guifg: " . baseSyn.guifg .
        \ " guibg: " . baseSyn.guibg
  let linkedSyn = s:get_syn_attr(s:get_syn_id(1))
  echo "link to"
  echo "name: " . linkedSyn.name .
        \ " ctermfg: " . linkedSyn.ctermfg .
        \ " ctermbg: " . linkedSyn.ctermbg .
        \ " guifg: " . linkedSyn.guifg .
        \ " guibg: " . linkedSyn.guibg
endfunction
command! SyntaxInfo call s:get_syn_info()
"-----------------------------------------------------------
"               Auto command
"-----------------------------------------------------------
augroup autoexe
    autocmd!
    autocmd FileType python nmap <buffer> <F5> :!python %<CR>
    autocmd FileType fortran nmap <buffer> <F5> :DoFortran<CR>
    autocmd FileType cpp nmap <buffer> <F5> :DoCpp<CR>
augroup END
command! DoFortran call s:DoFortran()
command! DoCpp call s:DoCpp()
command! -nargs=1 Vds call s:VDiff(<f-args>)
command! -nargs=1 TEST call s:TEST(<f-args>)
function! s:DoFortran()
    :!ifort % -o %<
    :!./%<
endfunction
function! s:DoCpp()
    :!icc % -o %<
    :!./%<
endfunction
function! s:VDiff(txt)
    let foo = a:txt
    :vertical diffsplit foo
endfunction
function! s:TEST(bar)
    echo a:bar
endfunction
" Namelist for fortran
if has("autocmd")
    let b:fortran_free_source = 1
    " unlet b:fortran_fixed_source
    au BufNewFile,BufRead *.nml set filetype=fortran
    au BufNewFile,BufRead *.namelist set filetype=fortran
endif
" Switch Free format and Fixed format.
nmap <S-F> :set syntax=fortran<CR>:let b:fortran_fixed_source=!b:fortran_fixed_source<CR>:set syntax=text<CR>:set syntax=fortran<CR>
nmap <C-F> :filetype detect<CR>
" Syntax on/off switch
nmap <F7> :if exists("g:syntax_on") <Bar> syntax off <Bar> else <Bar> syntax enable <Bar> endif<CR>
"C-----------------------------------------------------------
"               Plugin Installed Checker
"-----------------------------------------------------------
function s:is_plugged(name)
    if exists('g:plugs') && has_key(g:plugs, a:name) && isdirectory(g:plugs[a:name].dir)
        return 1
    else
        return 0
    endif
endfunction
"-----------------------------------------------------------
"               Plugin Manager
"-----------------------------------------------------------
call plug#begin()
    Plug 'preservim/nerdtree'       "Tree type directory
    Plug 'guns/xterm-color-table.vim'   " Show Xterm color table
    Plug 'Vimjas/vim-python-pep8-indent'    " indent based on pep8
    Plug 'hachibeeDI/python_hl_lvar.vim'    " local variable highlight
    Plug 'nathanaelkane/vim-indent-guides'  " Show Vim Indent
"   Plug 'osyo-manga/vim-over'
"   Plug 'vim-python/python-syntax'
"   Plug 'neoclide/coc.nvim', {'branch': 'release'}
call plug#end()

" Plugin Keymap
nnoremap <C-n> :NERDTree<CR>
" let g:enable_python_hl_lvar = 1
augroup autoexe_plugin
    autocmd!
    if s:is_plugged("vim-indent-guides")
       "autocmd FileType python :IndentGuidesEnable
       nmap <F4> \ig    " backslash ig -> Switch IndentGuide
    endif
augroup end

