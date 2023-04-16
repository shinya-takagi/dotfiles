-- local colorscheme = require "lazyvim.plugins.colorscheme"
return {
  "Mofiqul/vscode.nvim",
  -- "loctvl842/monokai-pro.nvim",
  config = function()
    -- require("monokai-pro").setup({
    require("vscode").setup({
      -- filter = "classic",
      italic_comments = false,
    })
  end,
  {
    "LazyVim/LazyVim",
    opts = {
      -- colorscheme = "monokai-pro",
      colorscheme = "vscode",
    },
  },
}
