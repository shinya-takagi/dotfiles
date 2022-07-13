"================================================>
"       Neo-vim Setting
"================================================>

let s:Setting_Directory = expand('$HOME/.config/nvim/setting')
" echo b:Setting_Directory
" echo join([s:Setting_Directory, '/general.vim'], '')

"               Tips
"   Source command run before it expand variables,
"   so it must put "execute" command.
"

" General setting
" source /home/shinya/.config/nvim/setting/general.vim
execute 'source ' join([s:Setting_Directory, '/general.vim'], '')
" Autocommand define
" source $HOME/.config/nvim/setting/autocommand.vim
execute 'source ' join([s:Setting_Directory, '/autocommand.vim'], '')
" Plugin and Lua script
if filereadable(expand('~/.local/share/nvim/site/autoload/plug.vim'))
    execute 'source ' join([s:Setting_Directory, '/plugin.vim'], '')
    " execute 'source ' join([s:Setting_Directory, '/minimal_plugin.vim'], '')
endif

" if filereadable(expand('~/.local/share/nvim/site/autoload/plug.vim'))
"     echo 'test'
" endif

