-- Chadrc overrides this file

local M = {}

-- M.options = {
--   nvChad = {
--     update_url = "https://github.com/NvChad/NvChad",
--     update_branch = "main",
--   },
-- }
M.ui = {
  -- hl = highlights
  -- hl_add = { },
  -- hl_override = require "custom.themes.monokai_override",
  -- changed_themes = { require "custom.themes.monokai" },
  theme_toggle = { "vscode_dark", "monokai"},
  -- transparency = false,
  theme = "monokai",
  -- theme = "monokai",
}

-- M.plugins = {}
M.plugins = require "custom.plugins"

-- check core.mappings for table structure
-- M.mappings = require "core.mappings"
M.mappings = require "custom.mappings"

return M
