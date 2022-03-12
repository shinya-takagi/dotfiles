"================================================>
"       Neo-vim Setting
"================================================>

"----Set about file config.---->
 set encoding=utf-8
 set fileencodings=uft-8 ",iso-2022-jp,sjis
 scriptencoding utf-8
 filetype plugin indent on
 syntax on
"-----Colorscheme----->
 colorscheme ThemerVim
 set background=dark

"----General Setting---->
"set nocompatible   " vi is compatible to vim.
 set number         " show line numbers
 set ruler          " show ruler
 set title          " show title
 set showcmd        " show commands until writing.
 set showmatch      " move between ( and )
 set autoindent     " insert indent when put Enter-key (if, for, etc...)
 set wildmenu       " show list after inserting words.
 set wildmode=full
 set noswapfile     " Don't generate Swap file.
 set cursorline     " cursor line 
 set incsearch      " Real time highlight search.

"-----Tab setting----->
 set expandtab       " use space instead of tab.
 set smartindent    " insert indent automatically.
 set shiftwidth=4   " tab is 4 space in smartindent.
 set softtabstop=4  " tab insert 4 space.
 
"=============================================>
"           Key mapping
"=============================================>
"----Disable Arrow-keys----->
 noremap <Up> <Nop>
 noremap <Down> <Nop>
 noremap <Left> <Nop>
 noremap <Right> <Nop>
" Retern normal mode to push jj.
 imap jj <ESC> 

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
" Comment for LaTeX(TeX)
iab %-> %------------------------------------------------->
iab %-< %-------------------< 
" Create Shebang automatically
iab SHEBANG #!/usr/bin/env
" --------------------------<
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
function! s:DoFortran()
    :!ifort % -o %<
    :!./%<
endfunction
function! s:DoCpp()
    :!icc % -o %<
    :!./%<
endfunction

"-----------------------------------------------------------
"         Plugin Manager
"-----------------------------------------------------------
" Define 'is_plugged' function.
function s:is_plugged(name)
    if exists('g:plugs') && has_key(g:plugs, a:name) && isdirectory(g:plugs[a:name].dir)
        return 1
    else
        return 0
    endif
endfunction

" Plugin Manager : Vim-Plug(https://github.com/junegunn/vim-plug)
call plug#begin()
"   Language server for vim 'vim-lsp'
    Plug 'prabirshrestha/vim-lsp'
    Plug 'mattn/vim-lsp-settings'
    Plug 'vim-airline/vim-airline'          " Powerline fonts for Vim 
    Plug 'vim-airline/vim-airline-themes'   " For Airline themes
    Plug 'ryanoasis/vim-devicons'           " Various icons for Vim.
"   nvim-treesitter supports various syntax highlights. Require neovim-nightly
    Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
call plug#end()
"------ vim-airline commands ----------------->
if s:is_plugged("vim-airline")
    let g:airline_powerline_fonts = 1               "Use Powerline fonts
    let g:airline#extensions#tabline#enabled = 1    "Show tab line at opening files
    "let g:airline_theme = 'powerlineish'           "Change Airline color theme
    let g:airline_theme = 'molokai'                 "Change Airline color theme
    if !exists('g:airline_symbols')
    let g:airline_symbols = {}
    endif
"   let g:airline_left_sep = '⮀'                    "Separeter for left
"   let g:airline_left_alt_sep = '⮁'
"   let g:airline_right_sep = '⮂'                   "Separater for right
"   let g:airline_right_alt_sep = '⮃'
    let g:airline_symbols.crypt = '🔒'              "暗号化されたファイル
"   let g:airline_symbols.linenr = '¶'              "行
    let g:airline_symbols.linenr = 'LINE'           "行
    let g:airline_symbols.maxlinenr = 'MAX㏑'       "最大行
    let g:airline_symbols.branch = '⭠'              "gitブランチ
    let g:airline_symbols.paste = 'ρ'               "ペーストモード
    let g:airline_symbols.spell = 'Ꞩ'               "スペルチェック
    let g:airline_symbols.notexists = '∄'           "gitで管理されていない場合
    let g:airline_symbols.whitespace = 'Ξ'          "空白の警告(余分な空白など)
endif

"=====================================================>
"       Lua script
"=====================================================>
" Syntax highlight with nvim-treesitter
lua <<EOF
require'nvim-treesitter.configs'.setup{
    highlight = {
        enable = true,
        disable = {
            'ruby',
        }
    }
}
EOF


