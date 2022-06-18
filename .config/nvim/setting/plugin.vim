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
"----Language server for vim 'vim-lsp'----->
"   Plug 'prabirshrestha/vim-lsp'
"   Plug 'mattn/vim-lsp-settings'
"-----Language server neovim and completion ----->
"   nvim-cmp(https://github.com/hrsh7th/nvim-cmp)-----> 
    Plug 'neovim/nvim-lspconfig'
    Plug 'williamboman/nvim-lsp-installer'
    Plug 'hrsh7th/cmp-nvim-lsp'
    Plug 'hrsh7th/cmp-buffer'
    Plug 'hrsh7th/cmp-path'
    Plug 'hrsh7th/cmp-cmdline'
    Plug 'hrsh7th/nvim-cmp'
"-------Completion---------<
"
"----Snippet plugin------->
"" For luasnip users.
    Plug 'L3MON4D3/LuaSnip'
    Plug 'saadparwaiz1/cmp_luasnip'
"-------Snippet-------<

"----Vim Airline----->
    Plug 'vim-airline/vim-airline'          " Powerline fonts for Vim 
    Plug 'vim-airline/vim-airline-themes'   " For Airline themes
    Plug 'ryanoasis/vim-devicons'           " Various icons for Vim.
"-------Airline----<
"
"----nvim-treesitter---------->
    " nvim-treesitter supports various syntax highlights. Require neovim-nightly
    Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
    " adjust treesitter colorscheme
    Plug 'Th3Whit3Wolf/one-nvim'
    Plug 'Th3Whit3Wolf/space-nvim'
    Plug 'tanvirtin/monokai.nvim'
    Plug 'nekonako/xresources-nvim'
    Plug 'EdenEast/nightfox.nvim' " Vim-Plug
    Plug 'yonlu/omni.vim'
"-------treesitter-----<
"
"------Filer plugin----->
    Plug 'lambdalisue/fern.vim'
    Plug 'antoinemadec/FixCursorHold.nvim'
"------Filer----->

call plug#end()
set completeopt=menu,menuone,noselect
"-----Colorscheme----->
"colorscheme ThemerVim          " Original colorscheme
"colorscheme one-nvim
"colorscheme space-nvim
 colorscheme monokai
"colorscheme nightfox
"colorscheme omni
"-----Colorscheme-----<

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

" Language server of init.lua
lua <<EOF
    local configs = require 'lspconfig.configs'
    local util = require 'lspconfig.util'
    -- require'lspconfig'.pyright.setup{}
    -- require'lspconfig'.pylsp.setup{}
    local lsp_installer = require("nvim-lsp-installer")

-- Register a handler that will be called for each installed server when it's ready (i.e. when installation is finished
-- or if the server is already installed).
    lsp_installer.on_server_ready(function(server)
        local opts = {}

        -- (optional) Customize the options passed to the server
        -- if server.name == "tsserver" then
        --     opts.root_dir = function() ... end
        -- end

        -- This setup() function will take the provided server configuration and decorate it with the necessary properties
        -- before passing it onwards to lspconfig.
        -- Refer to https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md
        server:setup(opts)
    end)

    -- Mappings.
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
    local opts = { noremap=true, silent=true }
    vim.api.nvim_set_keymap('n', '<space>e', '<cmd>lua vim.diagnostic.open_float()<CR>', opts)
    vim.api.nvim_set_keymap('n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<CR>', opts)
    vim.api.nvim_set_keymap('n', ']d', '<cmd>lua vim.diagnostic.goto_next()<CR>', opts)
    vim.api.nvim_set_keymap('n', '<space>q', '<cmd>lua vim.diagnostic.setloclist()<CR>', opts)

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
    local on_attach = function(client, bufnr)
      -- Enable completion triggered by <c-x><c-o>
      vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')
    
      -- Mappings.
      -- See `:help vim.lsp.*` for documentation on any of the below functions
      vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
      vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
      vim.api.nvim_buf_set_keymap(bufnr, 'n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
      vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
      vim.api.nvim_buf_set_keymap(bufnr, 'n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
      vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
      vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
      vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
      vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
      vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
      vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
      vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
      vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>f', '<cmd>lua vim.lsp.buf.formatting()<CR>', opts)
    end
EOF

"-----Setup nvim-cmp----------->
lua <<EOF
  -- Setup nvim-cmp.
  local cmp = require'cmp'

  cmp.setup({
    snippet = {
      -- REQUIRED - you must specify a snippet engine
      expand = function(args)
        --vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
         require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
        -- require('snippy').expand_snippet(args.body) -- For `snippy` users.
        -- vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
      end,
    },
    mapping = {
      ['<C-b>'] = cmp.mapping(cmp.mapping.scroll_docs(-4), { 'i', 'c' }),
      ['<C-f>'] = cmp.mapping(cmp.mapping.scroll_docs(4), { 'i', 'c' }),
      ['<C-Space>'] = cmp.mapping(cmp.mapping.complete(), { 'i', 'c' }),
      ['<C-y>'] = cmp.config.disable, -- Specify `cmp.config.disable` if you want to remove the default `<C-y>` mapping.
      ['<C-e>'] = cmp.mapping({
        i = cmp.mapping.abort(),
        c = cmp.mapping.close(),
      }),
    -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
      ['<CR>'] = cmp.mapping.confirm({ select = true }),
    },
    sources = cmp.config.sources({
      { name = 'nvim_lsp' },
      -- { name = 'vsnip' }, -- For vsnip users.
      { name = 'luasnip' }, -- For luasnip users.
      -- { name = 'ultisnips' }, -- For ultisnips users.
      -- { name = 'snippy' }, -- For snippy users.
    }, {
      { name = 'buffer' },
    })
  })

  -- Set configuration for specific filetype.
  cmp.setup.filetype('gitcommit', {
    sources = cmp.config.sources({
      { name = 'cmp_git' }, -- You can specify the `cmp_git` source if you were installed it. 
    }, {
      { name = 'buffer' },
    })
  })

  -- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
  cmp.setup.cmdline('/', {
    sources = {
      { name = 'buffer' }
    }
  })

  -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
  cmp.setup.cmdline(':', {
    sources = cmp.config.sources({
      { name = 'path' }
    }, {
      { name = 'cmdline' }
    })
  })

  -- Setup lspconfig.
  -- local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
  -- -- Replace <YOUR_LSP_SERVER> with each lsp server you've enabled.
  -- require('lspconfig')['vimls'].setup {
  --   capabilities = capabilities
  --}
EOF
