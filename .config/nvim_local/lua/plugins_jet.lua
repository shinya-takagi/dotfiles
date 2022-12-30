-- Plugins for Jetpack

-- Automatic installation on startup
local jetpackfile = vim.fn.stdpath('data') .. '/site/pack/jetpack/opt/vim-jetpack/plugin/jetpack.vim'
local jetpackurl = "https://raw.githubusercontent.com/tani/vim-jetpack/master/plugin/jetpack.vim"
if vim.fn.filereadable(jetpackfile) == 0 then
  vim.fn.system(string.format('curl -fsSLo %s --create-dirs %s', jetpackfile, jetpackurl))
end

vim.cmd('packadd vim-jetpack')
-- vim.g.jetpack_copy_method = "copy"
require('jetpack.packer').startup(function(use)
  use { 'tani/vim-jetpack', as = "jetpack" } -- bootstrap
  use({ 'nvim-lua/plenary.nvim' }) -- Common utilities

  use({
    'tanvirtin/monokai.nvim',
    setup = function()
      require("monokai").setup({
        -- palette = monokai.pro
      })
      vim.cmd("colorscheme monokai")
    end
  })

  -- LSP
  use({
    'neovim/nvim-lspconfig',
    -- event = { "VimEnter" },
    config = function()
    end
  })
  use({
    'williamboman/mason.nvim',
    -- event = { "VimEnter" },
    config = function()
      local mason = require("mason")
      mason.setup({
        ui = {
          icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗"
          }
        }
      })

      local protocol = require('vim.lsp.protocol')
      protocol.CompletionItemKind = {
        '', -- Text
        '', -- Method
        '', -- Function
        '', -- Constructor
        '', -- Field
        '', -- Variable
        '', -- Class
        'ﰮ', -- Interface
        '', -- Module
        '', -- Property
        '', -- Unit
        '', -- Value
        '', -- Enum
        '', -- Keyword
        '﬌', -- Snippet
        '', -- Color
        '', -- File
        '', -- Reference
        '', -- Folder
        '', -- EnumMember
        '', -- Constant
        '', -- Struct
        '', -- Event
        'ﬦ', -- Operator
        '', -- TypeParameter
      }
    end
  })
  use({
    'williamboman/mason-lspconfig.nvim',
    -- event = { "VimEnter" },
    config = function()
      local nvim_lsp = require("lspconfig")
      local mason_lspconfig = require('mason-lspconfig')
      mason_lspconfig.setup_handlers({ function(server_name)
        local opts = {}
        -- opts.on_attach = function(_, bufnr)
        --   local bufopts = { silent = true, buffer = bufnr }
        --   vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
        --   vim.keymap.set('n', 'gtD', vim.lsp.buf.type_definition, bufopts)
        --   vim.keymap.set('n', 'grf', vim.lsp.buf.references, bufopts)
        --   vim.keymap.set('n', '<space>p', vim.lsp.buf.format, bufopts)
        -- end
        nvim_lsp[server_name].setup(opts)
      end
      })
    end
  })

  -- Utilities ---
  use({
    'windwp/nvim-autopairs',
    event = { "VimEnter" },
    config = function()
      require("nvim-autopairs").setup {}
    end
  }) -- Autocomplete pairs

  use({
    'lukas-reineke/indent-blankline.nvim',
    event = { "VimEnter" },
    config = function()
      local indent_blankline = require("indent_blankline")
      indent_blankline.setup({
        show_end_of_line = true,
        space_char_blankline = " ",
        show_current_context = true,
        show_current_context_start = true,
      })
    end
  }) -- Show indent line blank

  use {
    'folke/which-key.nvim',
    event = { "VimEnter" },
    config = function()
      require("which-key").setup {}
    end
  } -- Show Key binding

  -- Git
  use({
    'lewis6991/gitsigns.nvim',
    -- opt = { true },
    event = { "FocusLost", "CursorHold" },
    config = function()
      require('gitsigns').setup()
    end
  }) -- Show git signs
  
  use({
    'kyazdani42/nvim-web-devicons',
  }) -- Use more icons

  -- Status Line
  use({
    'nvim-lualine/lualine.nvim',
    event = { "VimEnter" },
    -- requires = {
    --   { 'kyazdani42/nvim-web-devicons', module = { "nvim-web-devicons" } }
    -- },
    config = function()
      local lualine = require("lualine")
      lualine.setup {
        options = {
          globalstatus = true,
          theme = 'nightfly'
        },
      }
    end
  }) -- Powerline fonts for neovim

  -- Scroll bar
  use({
    'petertriho/nvim-scrollbar',
    event = {
      "BufWinEnter",
      "CmdwinLeave",
      "TabEnter",
      "TermEnter",
      "TextChanged",
      "VimResized",
      "WinEnter",
      "WinScrolled",
    },
    config = function()
      require("scrollbar").setup({})
    end,
  }) -- Add scrollbar

  use {
    'kevinhwang91/nvim-hlslens',
    module = { "VimEnter" },
    config = function()
      require("hlslens").setup {}
      local opts = { noremap = true, silent = true }
      vim.api.nvim_set_keymap('n', 'n',
        [[<Cmd>execute('normal! ' . v:count1 . 'n')<CR><Cmd>lua require('hlslens').start()<CR>]], opts)
      vim.api.nvim_set_keymap('n', 'N',
        [[<Cmd>execute('normal! ' . v:count1 . 'N')<CR><Cmd>lua require('hlslens').start()<CR>]], opts)
      vim.api.nvim_set_keymap('n', '*', [[*<Cmd>lua require('hlslens').start()<CR>]], opts)
      vim.api.nvim_set_keymap('n', '#', [[#<Cmd>lua require('hlslens').start()<CR>]], opts)
      vim.api.nvim_set_keymap('n', 'g*', [[g*<Cmd>lua require('hlslens').start()<CR>]], opts)
      vim.api.nvim_set_keymap('n', 'g#', [[g#<Cmd>lua require('hlslens').start()<CR>]], opts)

      vim.api.nvim_set_keymap('n', '<Leader>l', ':noh<CR>', opts)
    end,
  } -- Counts of highlight words
  -- Treesitter
  use({ 'nvim-treesitter/nvim-treesitter' }) -- Treesitter Engine
  use({ 'JoosepAlviste/nvim-ts-context-commentstring' }) -- treesitter plugin show functions on cursor

end)

-- Automatic plugin installation on startup
local jetpack = require('jetpack')
for _, name in ipairs(jetpack.names()) do
  if not jetpack.tap(name) then
    -- jetpack.sync()
    -- print(name)
    break
  end
end
