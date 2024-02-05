return {
  "mfussenegger/nvim-lint",

  opts = {
    linters_by_ft = {
      fish = { "fish" },
      -- lua = { "luacheck" },
      python = { "ruff" },
      sh = { "shellcheck" },
      latex = { "chktex" },
    },
    -- TODO: Add more custom linters
    linters = {},
  },
}
