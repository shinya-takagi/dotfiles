"================================================>
"       Neo-vim Setting
"================================================>

let b:Setting_Directory = "/home/shinya/.config/nvim/setting"
" echo b:Setting_Directory

" General setting
source /home/shinya/.config/nvim/setting/general.vim
" Autocommand define
source /home/shinya/.config/nvim/setting/autocommand.vim
" Plugin and Lua script
if filereadable(expand('~/.local/share/nvim/site/autoload/plug.vim'))
    source /home/shinya/.config/nvim/setting/plugin.vim
endif

" if filereadable(expand('~/.local/share/nvim/site/autoload/plug.vim'))
"     echo "test"
" endif

