return {
  "jose-elias-alvarez/null-ls.nvim",
  opts = function()
    local nls = require("null-ls")

    -- Setting for disabling formatting Fixed Fortran.
    local disabled_extensions_fortran = { "f", "for", "ftn" }
    local fprettify = nls.builtins.formatting.fprettify.with({
      runtime_condition = function(params)
        local extension = vim.fn.fnamemodify(params.bufname, ":e")
        return not vim.tbl_contains(disabled_extensions_fortran, extension)
      end,
    })
    -- Fixed Fortran setting.

    -- Load formatters
    return {
      sources = {
        nls.builtins.formatting.black,
        nls.builtins.formatting.stylua,
        fprettify,
      },
    }
  end,
}
