-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

vim.opt.relativenumber = false -- Default: true
vim.g.python3_host_prog = vim.fn.system("which python")
vim.opt.winbar = "%=%m %f"
vim.opt.swapfile = false
-- Use mouse in neovim. Put n(ormal), i(nsert), v(isual), c(ommand), a(ll), or ""
vim.opt.mouse = ""

-- FileType
vim.filetype.add({
  pattern = {
    ["*.code-workspace"] = "json",
  },
})
