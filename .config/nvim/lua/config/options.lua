-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

vim.opt.relativenumber = false -- Default: true
-- vim.g.python3_host_prog = vim.fn.system("which python")
vim.opt.winbar = "%=%m %f"
vim.opt.swapfile = false
-- Use mouse in neovim. Put n(ormal), i(nsert), v(isual), c(ommand), a(ll), or ""
vim.opt.mouse = ""

-- Transparent background
vim.opt.termguicolors = true
vim.opt.winblend = 0
vim.opt.pumblend = 0
vim.g.vscode_transparent = 1 -- Need for transparent background.
vim.opt.shell = "/usr/bin/zsh"

-- FileType
vim.filetype.add({
  filename = {
    -- ["~/research/langevin_fission/fission.code-workspace"] = "json",
  },
  pattern = {
    ["*.code-workspace"] = "jsonc",
    ["*.nml"] = "fortran",
  },
})
-- For VSCode workspace
vim.api.nvim_create_autocmd(
  { "BufEnter", "BufWinEnter" },
  { pattern = { "*.code-workspace" }, command = "set filetype=jsonc" }
)
-- For namelist in Fortran
vim.api.nvim_create_autocmd({ "BufEnter", "BufWinEnter" }, { pattern = { "*.nml" }, command = "set filetype=fortran" })

vim.opt.runtimepath:append("/usr/local/opt/fzf")
