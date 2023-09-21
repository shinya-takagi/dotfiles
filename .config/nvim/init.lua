-- bootstrap lazy.nvim, LazyVim and your plugins
if not vim.g.vscode then
  require("config.lazy")
else
  -- require("config.vscode")
  require("config.lazy")
  -- vim.opt.ignorecase = true
  -- vim.opt.smartcase = true
end
