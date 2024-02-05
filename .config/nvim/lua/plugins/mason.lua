return {
  "williamboman/mason.nvim",

  opts = {
    ensure_installed = {
      "stylua",
      "shellcheck",
      "shfmt",
      -- "flake8",
      -- "black",
      "fortls",
      -- "pyright",
      -- "ruff",
      -- "ruff-lsp",
      "rust-analyzer",
    },
  },
}
