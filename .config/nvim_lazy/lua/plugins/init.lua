-- Load plugins from core.lazy
return{
  "williamboman/mason-lspconfig.nvim",
  "nvim-lua/plenary.nvim",

  {
    "folke/which-key.nvim",
    event = { "VimEnter" },
    config = function()
      require("which-key").setup {}
    end
  },

  {
    "folke/tokyonight.nvim",
    lazy = false, -- make sure we load this during startup if it is your main colorscheme
    priority = 1000, -- make sure to load this before all the other start plugins
    config = function()
      -- load the colorscheme here
      vim.cmd([[colorscheme tokyonight]])
    end,
  },

  {
    "simrat39/symbols-outline.nvim",
    keys = { { "<leader>cs", "<cmd>SymbolsOutline<cr>", desc = "Symbols Outline" } },
    config = true,
  },

  -- Theme: icons
  {
    "nvim-tree/nvim-web-devicons",
    config = { default = true },
  },

  {
    'windwp/nvim-autopairs',
    event = { "VimEnter" },
    config = function()
      require("nvim-autopairs").setup {}
    end
  },


}
