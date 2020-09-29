set number

call plug#begin()
Plug 'davidhalter/jedi'
call plug#end()

colorscheme delek

execute pathogen#infect()
syntax on
filetype plugin indent on

nnoremap <slient><C-e> :NERDTreeToggle<CR>
