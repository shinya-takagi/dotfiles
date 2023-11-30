return {
  "stevearc/conform.nvim",

  opts = {
    formatters_by_ft = {
      fish = { "fish_indent" },
      python = { "black", "isort" },
      lua = { "stylua" },
      latex = { "latexindent" },
    },
  },
}
