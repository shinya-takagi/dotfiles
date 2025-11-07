return {
  require("lspconfig")["tinymist"].setup({
    settings = {
      projectResolution = "lockDatabase",
      -- for generating lockDatabase
      -- tinymist compile --save-lock main.typ
      formatterMode = "typstyle",
    },
  }),
}
