return {
  "mason-org/mason.nvim",

  opts = {
    ensure_installed = {
      "stylua",
      "shellcheck",
      "shfmt",
      -- "flake8",
      -- "black",
      "fortls",
      -- "pyright",
      "ruff",
      "rust-analyzer",
      "tinymist",
    },
  },
}
