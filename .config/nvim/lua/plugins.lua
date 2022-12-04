-- Use functions of vim built-in
local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system({
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  })
  print("Installing packer close and reopen Neovim...")
  vim.cmd([[packadd packer.nvim]])
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
-- vim.cmd([[
--   augroup packer_user_config
--     autocmd!
--     autocmd BufWritePost plugins.lua source <afile> | PackerSync
--   augroup end
-- ]])

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  return
end

-- Have packer use a popup window
packer.init({
  display = {
    open_fn = function()
      return require("packer.util").float({ border = "rounded" })
    end,
  },
})

-- local packer = nil
-- local function init()
--   if packer == nil then
--     packer = require("packer")
--     packer.init({ disable_commands = true })
--   end
--
--   local use = packer.use
--   packer.reset()

-- Install plugins
return packer.startup(function(use)

  use({
    'wbthomason/packer.nvim',
    opt = { true },
  })
  use({ 'nvim-lua/plenary.nvim' }) -- Common utilities

  -- Colorschemes
  -- use({ 'tanvirtin/monokai.nvim' })
  use({
    'EdenEast/nightfox.nvim',
    -- module = { "VimEnter" },
    config = function()
      local nightfox = require("nightfox")
      nightfox.setup({
        options = {
          styles = { -- Style to be applied to different syntax groups
            comments = "italic", -- Value is any valid attr-list value `:help attr-list`
            conditionals = "NONE",
            constants = "NONE",
            functions = "NONE",
            keywords = "NONE",
            numbers = "NONE",
            operators = "NONE",
            strings = "NONE",
            types = "NONE",
            variables = "NONE",
          },
        }
      })
      vim.cmd('colorscheme carbonfox')
    end
  }) -- Color scheme
  -- use({ 'sainnhe/sonokai' })

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

  -- Utilities
  use({
    'windwp/nvim-autopairs',
    event = { "VimEnter" },
    config = function()
      require("nvim-autopairs").setup {}
    end
  }) -- Autocomplete pairs
  use({
    'RRethy/vim-illuminate',
    event = { "VimEnter" },
  }) -- Illuminate same variables
  use({
    'SmiteshP/nvim-navic',
    event = { "VimEnter" },
    requires = {
      "neovim/nvim-lspconfig"
    },
  }) -- Show function name.
  use({
    'simrat39/symbols-outline.nvim',
    event = { "VimEnter" },
    config = function()
      local symbol = require("symbols-outline")
      local opts = {
        highlight_hovered_item = true,
        show_guides = true,
        auto_preview = false,
        position = 'right',
        relative_width = true,
        width = 25,
        auto_close = false,
        show_numbers = false,
        show_relative_numbers = false,
        show_symbol_details = true,
        preview_bg_highlight = 'Pmenu',
        autofold_depth = nil,
        auto_unfold_hover = true,
        fold_markers = { '', '' },
        wrap = false,
        keymaps = { -- These keymaps can be a string or a table for multiple keys
          close = { "<Esc>", "q" },
          goto_location = "<Cr>",
          focus_location = "o",
          hover_symbol = "<C-space>",
          toggle_preview = "K",
          rename_symbol = "r",
          code_actions = "a",
          fold = "h",
          unfold = "l",
          fold_all = "W",
          unfold_all = "E",
          fold_reset = "R",
        },
        lsp_blacklist = {},
        symbol_blacklist = {},
        symbols = {
          File = { icon = "", hl = "TSURI" },
          Module = { icon = "", hl = "TSNamespace" },
          Namespace = { icon = "", hl = "TSNamespace" },
          Package = { icon = "", hl = "TSNamespace" },
          Class = { icon = "𝓒", hl = "TSType" },
          Method = { icon = "ƒ", hl = "TSMethod" },
          Property = { icon = "", hl = "TSMethod" },
          Field = { icon = "", hl = "TSField" },
          Constructor = { icon = "", hl = "TSConstructor" },
          Enum = { icon = "ℰ", hl = "TSType" },
          Interface = { icon = "ﰮ", hl = "TSType" },
          Function = { icon = "", hl = "TSFunction" },
          Variable = { icon = "", hl = "TSConstant" },
          Constant = { icon = "", hl = "TSConstant" },
          String = { icon = "𝓐", hl = "TSString" },
          Number = { icon = "#", hl = "TSNumber" },
          Boolean = { icon = "⊨", hl = "TSBoolean" },
          Array = { icon = "", hl = "TSConstant" },
          Object = { icon = "⦿", hl = "TSType" },
          Key = { icon = "🔐", hl = "TSType" },
          Null = { icon = "NULL", hl = "TSType" },
          EnumMember = { icon = "", hl = "TSField" },
          Struct = { icon = "𝓢", hl = "TSType" },
          Event = { icon = "🗲", hl = "TSType" },
          Operator = { icon = "+", hl = "TSOperator" },
          TypeParameter = { icon = "𝙏", hl = "TSParameter" }
        },
      },
          symbol.setup({})
    end
  }) -- Show Symbol at outline
  use({
    'lukas-reineke/indent-blankline.nvim',
    event = { "VimEnter" },
    config = function()
      local indent_blankline = require("indent_blankline")
      -- Icon setting
      -- vim.opt.list = true
      -- vim.opt.listchars:append "space: "
      -- vim.opt.listchars:append "eol:"


      indent_blankline.setup({
        show_end_of_line = true,
        space_char_blankline = " ",
        show_current_context = true,
        show_current_context_start = true,
      })
    end
  }) -- Show indent line blank
  -- use({ 'rcarriga/nvim-notify' }) -- Show Notification popup
  -- use({ 'MunifTanjim/nui.nvim' }) -- UI Component

  use({
    'folke/noice.nvim',
    event = { "BufRead", "BufNewFile", "InsertEnter", "CmdlineEnter" },
    module = { "noice" },
    requires = {
      { "MunifTanjim/nui.nvim" },
      {
        "rcarriga/nvim-notify",
        module = { "notify" },
        config = function()
          require("notify").setup {
            -- nvim-notify の設定
          }
        end
      },
    },
    wants = { "nvim-treesitter" },
    setup = function()
      if not _G.__vim_notify_overwritten then
        vim.notify = function(...)
          local args = { ... }
          require "notify"
          require "noice"
          vim.schedule(function()
            vim.notify(unpack(args))
          end)
        end
        _G.__vim_notify_overwritten = true
      end
    end,
    config = function()
      require("noice").setup {
        -- noice.nvim の設定
        lsp = {
          -- override markdown rendering so that **cmp** and other plugins use **Treesitter**
          override = {
            ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
            ["vim.lsp.util.stylize_markdown"] = true,
            ["cmp.entry.get_documentation"] = true,
          },
          signature = {
            enabled = false
          },
        },
        -- config.lsp.signature.enabled = false,
        -- you can enable a preset for easier configuration
        presets = {
          bottom_search = true, -- use a classic bottom cmdline for search
          command_palette = true, -- position the cmdline and popupmenu together
          long_message_to_split = true, -- long messages will be sent to a split
          inc_rename = false, -- enables an input dialog for inc-rename.nvim
          lsp_doc_border = false, -- add a border to hover docs and signature help
        },
      }
    end
  }) -- Richment notice

  use({
    'ethanholz/nvim-lastplace',
    event = { "VimEnter" },
  }) -- Remember last position when it opened.
  -- Vim Compatibles
  use({
    'machakann/vim-sandwich',
    event = { "VimEnter" },
  }) -- Add operator surrounding
  -- use({ 'thinca/vim-quickrun' }) -- Quickly run the code in buffer.
  -- use({ 'lambdalisue/vim-quickrun-neovim-job' }) -- For neovim quickrun job
  -- use({ 'is0n/jaq-nvim' }) -- Quickrun for neovim.
  -- use({ 'CRAG666/code_runner.nvim', requires = 'nvim-lua/plenary.nvim' }) -- Code runner for Neovim
  use {
    'folke/which-key.nvim',
    event = { "VimEnter" },
    config = function()
      require("which-key").setup {}
    end
  } -- Show Key binding

  use({
    'ray-x/lsp_signature.nvim',
    event = { "VimEnter" },
    config = function()
      local signature = require("lsp_signature")
      local cfg = {}
      signature.setup(cfg)
      signature.on_attach()
    end
  }) -- Show signature help on function
  use({
    'folke/lsp-colors.nvim',
    event = { "VimEnter" },
  }) -- Add LSP colors
  use({
    'kkharji/lspsaga.nvim',
    event = { "VimEnter" },
    config = function()
      local saga = require("lspsaga")
      saga.init_lsp_saga {
        server_filetype_map = {
          -- typescript = 'typescript'
          lua = 'lua'
        }
      }
      local opts = { noremap = true, silent = true }
      vim.keymap.set('n', '<C-j>', '<Cmd>Lspsaga diagnostic_jump_next<CR>', opts)
      vim.keymap.set('n', 'K', '<Cmd>Lspsaga hover_doc<CR>', opts)
      vim.keymap.set('n', 'gd', '<Cmd>Lspsaga lsp_finder<CR>', opts)
      vim.keymap.set('i', '<C-k>', '<Cmd>Lspsaga signature_help<CR>', opts)
      vim.keymap.set('n', 'gp', '<Cmd>Lspsaga preview_definition<CR>', opts)
      vim.keymap.set('n', 'gr', '<Cmd>Lspsaga rename<CR>', opts)
    end
  }) -- Lsp helper
  use({
    'folke/trouble.nvim',
    event = { "VimEnter" },
    config = function()
      local trouble = require("trouble")
      trouble.setup({})
      vim.api.nvim_set_keymap('n', '<S-t>', '<cmd>TroubleToggle<CR>', { noremap = true })
    end
  }) -- Show warning/error like VSCode
  use({
    'onsails/lspkind.nvim',

    event = { "VimEnter" },
    config = function()

      local lspkind = require("lspkind")
      lspkind.init({
        -- enables text annotations
        --
        -- default: true
        mode = 'symbol',
        -- default symbol map
        -- can be either 'default' (requires nerd-fonts font) or
        -- 'codicons' for codicon preset (requires vscode-codicons font)
        --
        -- default: 'default'
        preset = 'codicons',
        -- override preset symbols
        --
        -- default: {}
        symbol_map = {
          Text = "",
          Method = "",
          Function = "",
          Constructor = "",
          Field = "ﰠ",
          Variable = "",
          Class = "ﴯ",
          Interface = "",
          Module = "",
          Property = "ﰠ",
          Unit = "塞",
          Value = "",
          Enum = "",
          Keyword = "",
          Snippet = "",
          Color = "",
          File = "",
          Reference = "",
          Folder = "",
          EnumMember = "",
          Constant = "",
          Struct = "פּ",
          Event = "",
          Operator = "",
          TypeParameter = ""
        },
      })
    end
  }) -- Show icons in completion on lsp

  -- Treesitter
  use({ 'nvim-treesitter/nvim-treesitter' }) -- Treesitter Engine
  -- use({ 'ray-x/cmp-treesitter' })
  use({ 'JoosepAlviste/nvim-ts-context-commentstring' }) -- treesitter plugin show functions on cursor

  -- Linter formatter
  -- use({ 'jose-elias-alvarez/null-ls.nvim' }) -- Linter and formatter
  -- use({ 'mhartington/formatter.nvim' }) -- Formatter

  -- Git
  use({
    'lewis6991/gitsigns.nvim',
    -- opt = { true },
    event = { "FocusLost", "CursorHold" },
    config = function()
      require('gitsigns').setup()
    end
  }) -- Show git signs

  -- Status Line
  use({
    'nvim-lualine/lualine.nvim',
    event = { "VimEnter" },
    requires = {
      { 'kyazdani42/nvim-web-devicons', module = { "nvim-web-devicons" } }
    },
    config = function()
      local lualine = require("lualine")
      lualine.setup {
        options = {
          globalstatus = true,
          -- theme = 'powerline_dark'
          -- theme = 'molokai'
          theme = 'nightfly'
        },
      }
    end
  }) -- Powerline fonts for neovim
  -- use({ 'kyazdani42/nvim-web-devicons' }) -- Various icons for neovim

  -- Sidebar
  use({
    'GustavoKatel/sidebar.nvim', -- cmd = "SidebarNvimToggle",
    opt = { true },
    config = function()

      local sidebar = require("sidebar-nvim")
      local opts = {
        open = false,
        bindings = {
          ['q'] = function() sidebar.close() end
        },
      }
      sidebar.setup(opts)

      local keymap = vim.api.nvim_set_keymap
      local opts_keymap = { noremap = true, silent = true }
      keymap('n', '<leader>st', ':SidebarNvimToggle<CR>', opts_keymap)
    end
  }) -- Add sidebar

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

  -- Filer
  use({
    'kyazdani42/nvim-tree.lua',
    module = { "VimEnter" },
    config = function()
      require("nvim-tree").setup {}
    end
  }) -- Neovim tree

  -- Fuzzy Finder
  use({
    'nvim-telescope/telescope.nvim',
    module = { "telescope" },
    requires = {
      { 'nvim-telescope/telescope-frecency.nvim',
        config = function()
          require 'telescope'.load_extension('frecency')
        end,
        opt = true
      },
      { 'kkharji/sqlite.lua', opt = true },
    },
    wants = {
      "telescope-frecency.nvim",
      "sqlite.lua",
    },
    setup = function()
      local function builtin(name)
        return function(opt)
          return function()
            return require("telescope.builtin")[name](opt or {})
          end
        end
      end

      -- local function extensions(name, prop)
      --   return function(opt)
      --     return function()
      --       local telescope = require "telescope"
      --       telescope.load_extension(name)
      --       return telescope.extensions[name][prop](opt or {})
      --     end
      --   end
      -- end

      local opts = { noremap = true, silent = true }
      vim.keymap.set('n', '<leader>ff', builtin "find_files" {})
      vim.keymap.set('n', '<leader>fg', builtin "live_grep" {})
      vim.keymap.set('n', '<leader>fb', builtin "buffers" {})
      vim.keymap.set('n', '<leader>fh', builtin "help_tags" { lang = "en" })
      vim.api.nvim_set_keymap('n', '<leader>fr', ':Telescope frecency<CR>', opts)

    end,
    config = function()
      require("telescope").setup {}
    end
  }) -- lua made in fuzzy finder
  -- use {
  --   'nvim-telescope/telescope-frecency.nvim',
  --   config = function()
  --     require 'telescope'.load_extension('frecency')
  --   end,
  --   requires = { 'kkharji/sqlite.lua' }
  -- } -- Extension of Telescope for search files

  -- Screen
  use({
    'goolord/alpha-nvim',
    module = { "VimEnter" },
    config = function()
      local alpha = require("alpha")
      local dashboard = require 'alpha.themes.dashboard'
      dashboard.section.header.val = {
        [[                               __                ]],
        [[  ___     ___    ___   __  __ /\_\    ___ ___    ]],
        [[ / _ `\  / __`\ / __`\/\ \/\ \\/\ \  / __` __`\  ]],
        [[/\ \/\ \/\  __//\ \_\ \ \ \_/ |\ \ \/\ \/\ \/\ \ ]],
        [[\ \_\ \_\ \____\ \____/\ \___/  \ \_\ \_\ \_\ \_\]],
        [[ \/_/\/_/\/____/\/___/  \/__/    \/_/\/_/\/_/\/_/]],
      }
      dashboard.section.buttons.val = {
        dashboard.button("e", "  New file", ":ene <BAR> startinsert <CR>"),
        dashboard.button("q", "  Quit NVIM", ":qa<CR>"),
        dashboard.button("t", "Tel: Run Telescope", ":Telescope<CR>")
      }
      -- local handle = io.popen('fortune')
      -- local fortune = handle:read("*a")
      -- handle:close()
      -- dashboard.section.footer.val = fortune
      dashboard.config.opts.noautocmd = true
      vim.cmd [[autocmd User AlphaReady echo 'ready']]
      alpha.setup(
        dashboard.config
      )
    end
  }) -- Custom menu

  -- Terminal
  use {
    'akinsho/toggleterm.nvim',
    module = { "VimEnter" },
    config = function()
      require('toggleterm').setup()
    end
  } -- Improved builtin-Terminal

  -- Specific Language
  use({
    'folke/neodev.nvim',
    module = { "VimEnter" },
    config = function()
      local neodev = require("neodev")
      neodev.setup({
        -- Add options
      })
    end
  }) -- Develop for lua
  -- use({ 'lervag/vimtex', ft = { "tex" } }) -- All-in-one LaTeX for vim/neovim

  -- if PACKER_BOOTSTRAP then
  --   require("packer").sync()
  -- end

  -- Completions
  use({
    'hrsh7th/nvim-cmp',
    module = { "cmp" },
    requires = {
      -- { 'hrsh7th/cmp-nvim-lsp', event = { "VimEnter" } }, -- LSP completions
      -- { 'hrsh7th/cmp-buffer', event = { "VimEnter" } }, -- buffer completions
      -- { 'hrsh7th/cmp-path', event = { "VimEnter" } }, -- path completions
      -- { 'hrsh7th/cmp-cmdline', event = { "VimEnter" } }, -- command line completions
      -- { 'hrsh7th/vim-vsnip', event = { "VimEnter" } }, -- Snipet like VSCode
      -- { 'ray-x/cmp-treesitter', event = { "VimEnter" } },
      { 'hrsh7th/cmp-nvim-lsp' }, -- LSP completions
      { 'hrsh7th/cmp-buffer' }, -- buffer completions
      { 'hrsh7th/cmp-path' }, -- path completions
      { 'hrsh7th/cmp-cmdline' }, -- command line completions
      { 'hrsh7th/vim-vsnip' }, -- Snipet like VSCode
      { 'ray-x/cmp-treesitter' },
    },
    config = function()
      local cmp = require("cmp")
      cmp.setup({
        snippet = {
          expand = function(args)
            -- require('luasnip').lsp_expand(args.body)
            require('vsnip').lsp_expand(args.body)
          end,
        },
        mapping = cmp.mapping.preset.insert({
          ['<C-b>'] = cmp.mapping.scroll_docs(-4),
          ['<C-f>'] = cmp.mapping.scroll_docs(4),
          ['<C-Space>'] = cmp.mapping.complete(),
          ['<C-e>'] = cmp.mapping.abort(),
          ['<CR>'] = cmp.mapping.confirm({ select = false }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
        }),
        sources = cmp.config.sources({
          { name = 'nvim_lsp' },
          { name = 'vsnip' }, -- For vsnip users.
          -- { name = 'luasnip' }, -- For luasnip users.
          -- { name = 'ultisnips' }, -- For ultisnips users.
          -- { name = 'snippy' }, -- For snippy users.
        }, {
          { name = 'buffer' },
          { name = 'path' },
          { name = 'treesitter' },
        }),
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
        mapping = cmp.mapping.preset.cmdline(),
        sources = {
          { name = 'buffer' }
        }
      })
      -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
      cmp.setup.cmdline(':', {
        mapping = cmp.mapping.preset.cmdline(),
        sources = cmp.config.sources({
          { name = 'path' }
        }, {
          { name = 'cmdline' }
        })
      })
      local nvim_lsp = require("lspconfig")
      -- Use an on_attach function to only map the following keys
      -- after the language server attaches to the current buffer
      local on_attach = function(client, bufnr)
        local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end

        local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

        --Enable completion triggered by <c-x><c-o>
        buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')
        -- Mappings.
        local opts = { noremap = true, silent = true }
        -- See `:help vim.lsp.*` for documentation on any of the below functions
        buf_set_keymap('n', 'gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>', opts)
        buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
        -- formatting
        if client.server_capabilities.documentFormattingProvider then
          vim.api.nvim_create_autocmd("BufWritePre", {
            group = vim.api.nvim_create_augroup("Format", { clear = true }),
            buffer = bufnr,
            callback = function() vim.lsp.buf.formatting_seq_sync() end
          })
        end
        -- To send formatted stream to null-ls
        --client.resolved_capabilities.document_formatting = false
      end
      local capabilities = require('cmp_nvim_lsp').default_capabilities(
        vim.lsp.protocol.make_client_capabilities()
      )
      nvim_lsp.flow.setup {
        on_attach = on_attach,
        capabilities = capabilities
      }
      local env = require("env")
      nvim_lsp.fortls.setup {
        on_attach = on_attach,
        root_dir = env.get("DOT_DIR") .. ".fortls"
      }
      nvim_lsp.tsserver.setup {
        on_attach = on_attach,
        filetypes = { "typescript", "typescriptreact", "typescript.tsx" },
        cmd = { "typescript-language-server", "--stdio" },
        capabilities = capabilities
      }
      nvim_lsp.sourcekit.setup {
        on_attach = on_attach,
      }
      -- nvim_lsp.sumneko_lua.setup {
      nvim_lsp.sumneko_lua.setup {
        on_attach = on_attach,
        settings = {
          Lua = {
            diagnostics = {
              -- Get the language server to recognize the `vim` global
              globals = { 'vim' },
            },
            workspace = {
              -- Make the server aware of Neovim runtime files
              library = vim.api.nvim_get_runtime_file("", true),
              checkThirdParty = false
            },
          },
        },
      }
      vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
        vim.lsp.diagnostic.on_publish_diagnostics, {
        underline = true,
        update_in_insert = false,
        virtual_text = { spacing = 4, prefix = "●" },
        severity_sort = true,
      }
      )
      -- Diagnostic symbols in the sign column (gutter)
      local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
      for type, icon in pairs(signs) do
        local hl = "DiagnosticSign" .. type
        vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
      end
      vim.diagnostic.config({
        virtual_text = {
          prefix = '●'
        },
        update_in_insert = true,
        float = {
          source = "always", -- Or "if_many"
        },
      })
    end
  }) -- cmp engine

end)
-- end
--
-- local plugins = setmetatable({}, {
--   __index = function(_, key)
--     init()
--     return packer[key]
--   end
-- })
--
-- return plugins
