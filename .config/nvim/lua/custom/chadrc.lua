-- Chadrc overrides this file

local M = {}

M.options = {
  nvChad = {
    update_url = "https://github.com/NvChad/NvChad",
    update_branch = "main",
  },
}
M.ui = {
  -- hl = highlights
  -- hl_add = { },
  -- hl_override = require "custom.themes.monokai",
  -- changed_themes = { require "custom.themes.monokai" },
  theme_toggle = { "onedark", "one_light",  "monekai", "vscode_dark", "monokai"},
  -- transparency = false,
  theme = "vscode_dark",
}

-- M.plugins = {}
M.plugins = require "custom.plugins"

-- check core.mappings for table structure
M.mappings = require "core.mappings"

return M
