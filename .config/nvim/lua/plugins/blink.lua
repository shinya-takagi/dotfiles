return {
  "saghen/blink.cmp",
  version = "*",
  opts = {
    sources = {
      default = { "lsp", "path", "snippets", "buffer" },
      per_filetype = {
        markdown = { "lsp", "path", "snippets" },
        typst = { "lsp", "path", "snippets" },
      },
    },
  },
}
