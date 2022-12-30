-- Plugins

local overrides = require "custom.plugins.overrides"

return {

  ------------- Default Plugins -------------------------------

  ["folke/which-key.nvim"] = {
    disable = false,
  },

  -- LspConfig
  ["neovim/nvim-lspconfig"] = {
      config = function()
        require "plugins.configs.lspconfig"
        require "custom.plugins.lspconfig"
      end,
  },

  -- Override default options
  ["williamboman/mason.nvim"] = { override_options = overrides.mason },

  ------------ New Plugins ----------------------------
  -- Show scrollbar
  ['petertriho/nvim-scrollbar'] = {
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
  },
  -- Use formatter and linter in Neovim
  ["jose-elias-alvarez/null-ls.nvim"] = {
      after = "nvim-lspconfig",
      config = function()
         require "custom.plugins.null-ls"
      end,
  },

  -- Show Treesitter elements
  ['nvim-treesitter/playground'] = {
    after = "nvim-treesitter",
    config = function ()
      require"nvim-treesitter.configs".setup({})
    end
  },



}
