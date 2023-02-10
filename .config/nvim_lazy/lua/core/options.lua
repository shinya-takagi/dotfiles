local opt = vim.opt
local g = vim.g
local cmd = vim.cmd

opt.encoding = "utf-8"
opt.fileencoding = "utf-8"
opt.title = true
opt.backup = false
opt.clipboard = "unnamedplus"
opt.cmdheight = 2
opt.completeopt = { "menuone", "noselect" }
opt.conceallevel = 0
opt.hlsearch = true
opt.ignorecase = true
opt.mouse = ""
opt.pumheight = 10
opt.showmode = false
opt.showtabline = 2
opt.smartcase = true
opt.smartindent = true
opt.swapfile = false
opt.termguicolors = true
opt.timeoutlen = 300
opt.undofile = true
opt.updatetime = 300
opt.writebackup = false
opt.shell = "zsh"
opt.backupskip = { "/tmp/*", "/private/tmp/*" }
opt.expandtab = true
opt.shiftwidth = 2
opt.tabstop = 2
-- cursorline = true
opt.number = true
opt.numberwidth = 4
opt.signcolumn = "yes"
opt.wrap = false
opt.winblend = 0
opt.wildoptions = "pum"
opt.pumblend = 5
opt.background = "dark"
opt.scrolloff = 8
opt.sidescrolloff = 8
-- guifont = "monospace:h17"
-- When on new window opens at a current window in bottom if you split a window.
opt.splitbelow = false
-- When on new window opens at a current window in right if you split a window vertically.
opt.splitright = false

-- Python Environment
-- vim.g.python3_host_prog = "/usr/bin/python"
g.python3_host_prog = vim.fn.system("which python")

opt.shortmess:append("c")

cmd("set whichwrap+=<,>,[,],h,l")
cmd([[set iskeyword+=-]])
cmd([[set formatoptions-=cro]]) -- TODO: this doesn't seem to work

-- Builtin vim Plugins
g.loaded_2html_plugin = 1
g.loaded_getscript = 1
g.loaded_getscriptPlugin = 1
g.loaded_gzip = 1
g.loaded_logipat = 1
g.loaded_netrw = 1
g.loaded_netrwPlugin = 1
g.loaded_netrwSettings = 1
g.loaded_netrwFileHandlers = 1
g.loaded_matchit = 1
g.loaded_tar = 1
g.loaded_tarPlugin = 1
g.loaded_rrhelper = 1
g.loaded_spellfile_plugin = 1
g.loaded_vimball = 1
g.loaded_vimballPlugin = 1
g.loaded_zip = 1
g.loaded_zipPlugin = 1
g.loaded_tutor = 1
g.loaded_rplugin = 1
g.loaded_syntax = 1
g.loaded_synmenu = 1
g.loaded_optwin = 1
g.loaded_compiler = 1
g.loaded_bugreport = 1
g.loaded_ftplugin = 1
