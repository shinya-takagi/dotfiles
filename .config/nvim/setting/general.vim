"================================================>
"       Neo-vim General Setting
"================================================>

"----Set about file config.---->
 set encoding=utf-8
 set fileencodings=uft-8 ",iso-2022-jp,sjis
 scriptencoding utf-8
 filetype plugin indent on
 syntax on
"-----Colorscheme----->
"colorscheme ThemerVim
 set background=dark

"----General Setting---->
"set nocompatible   " vim is compatible to vi.
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
 set expandtab      " use space instead of tab.
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
 noremap ; :

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
