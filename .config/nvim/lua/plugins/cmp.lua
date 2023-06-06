return {
  -- "hrsh7th/nvim-cmp",
  -- dependencies = { "tzacher/cmp-tabnine"},

  "tzachar/cmp-tabnine",

  opts = function()
    local cmp = require("cmp")
    return {
      build = "./install.sh",
      dependencies = "hrsh7th/nvim-cmp",

      cmp.setup({
        sources = {
          { name = "cmp_tabnine" },
        },
      }),
    }
  end,
}
