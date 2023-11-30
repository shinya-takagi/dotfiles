return {
  "linux-cultist/venv-selector.nvim",
  cmd = "VenvSelect",
  opts = {
    name = {
      "venv",
      ".venv",
      "env",
      ".env",
    },
    dap_enabled = false, -- Ensure that the venv selector affect PythonPath in nvim-dap as well!
  },
  keys = { { "<leader>cv", "<cmd>:VenvSelect<cr>", desc = "Select VirtualEnv" } },
}
