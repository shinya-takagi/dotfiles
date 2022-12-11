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
  }


}
