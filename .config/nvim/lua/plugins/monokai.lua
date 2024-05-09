-- local colorscheme = require "lazyvim.plugins.colorscheme"
return {
  -- "Mofiqul/vscode.nvim",
  -- "loctvl842/monokai-pro.nvim",
  "folke/tokyonight.nvim",
  -- opts = { style = "storm" },
  config = function()
    require("tokyonight").setup({
      -- require("monokai-pro").setup({
      -- require("vscode").setup({
      -- filter = "classic",
      -- italic_comments = false,
      transparent = true,
      style = "storm",
      -- styles = {
      --   sidebars = "transparent",
      --   floats = "transparent",
      -- },
    })
  end,
  -- {
  --   "LazyVim/LazyVim",
  --   opts = {
  --     -- colorscheme = "monokai-pro",
  --     -- colorscheme = "vscode",
  --     colorscheme = "tokyonight",
  --   },
  -- },
}
