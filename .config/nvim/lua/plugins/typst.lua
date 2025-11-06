return {
  "chomosuke/typst-preview.nvim",
  lazy = false, -- or ft = 'typst'
  version = "1.*",
  opts = {}, -- lazy.nvim will implicitly calls `setup {}`

  require("lspconfig")["tinymist"].setup({
    settings = {
      projectResolution = "lockDatabase",
      -- for generating lockDatabase
      -- tinymist compile --save-lock main.typ
    },
  }),
}
