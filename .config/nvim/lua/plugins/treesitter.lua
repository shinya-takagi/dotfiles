return {
  { "nvim-treesitter/playground", cmd = "TSPlaygroundToggle" },

  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    event = "BufReadPost",
    dependencies = {
      "nvim-treesitter/nvim-treesitter-textobjects",
    },
    config = function()
      require("nvim-treesitter.configs").setup({
        ensure_installed = {
          "bash",
          "gitignore",
          "latex",
          "lua",
          "markdown",
          "python",
          "vim",
        },
        sync_install = false,
        auto_install = false,
        highlight = { enable = true },
        indent = { enable = false },
      })
    end,
  }
}
