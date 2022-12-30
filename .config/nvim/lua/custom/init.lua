-- Custom Config

local opt = vim.o

opt.mouse = ""  -- Disable mouse

vim.g.python3_host_prog = vim.fn.system("which python")
