return {
  "CRAG666/code_runner.nvim",

  keys = {
    { "<leader>rc", "<cmd>RunCode<CR>", desc = "Run code" },
    { "<leader>rl", "<cmd>RunClose<CR>", desc = "Run close" },
    { "<leader>rp", "<cmd>RunProject<CR>", desc = "Run project" },
    { "<leader>rf", "<cmd>RunFile<CR>", desc = "Run file" },
  },

  opts = function()
    local code_runner = require("code_runner")
    return {
      code_runner.setup({
        filetype = {
          python = "poetry run python -u",
        },
      }),
    }
  end,
}
