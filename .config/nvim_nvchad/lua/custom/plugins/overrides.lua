-- Override in Plugins
local M = {}


M.mason = {
  ensure_installed = {
    "lua-language-server",

    -- Fortran
    "fortls",

    -- Python
    -- "pyright",
    "python-lsp-server",
  },
}

return M
