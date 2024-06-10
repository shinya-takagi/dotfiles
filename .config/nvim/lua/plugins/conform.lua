return {
  "stevearc/conform.nvim",

  opts = {
    formatters_by_ft = {
      fish = { "fish_indent" },
      python = { "ruff_fix", "ruff_format" },
      lua = { "stylua" },
      latex = { "latexindent" },
      fortran = { "fprettify" },
    },
  },
}
