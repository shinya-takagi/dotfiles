return {
    "jose-elias-alvarez/null-ls.nvim",
    opts = function()
      local nls = require("null-ls")
      return {
          sources = {
              nls.builtins.formatting.black,
              nls.builtins.formatting.stylua,
          },
      }
    end,
}
