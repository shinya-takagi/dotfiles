-- print("init.lua")
-- vim.g.did_install_default_menus = 1
-- vim.g.did_install_syntax_menu = 1
-- vim.g.did_indent_on = 1
-- vim.g.did_load_filetypes = 1
-- vim.g.did_load_ftplugin = 1
-- vim.g.loaded_2html_plugin = 1
-- vim.g.loaded_gzip = 1
-- vim.g.loaded_man = 1
-- vim.g.loaded_matchit = 1
-- vim.g.loaded_matchparen = 1
-- vim.g.loaded_netrwPlugin = 1
-- vim.g.loaded_remote_plugins = 1
-- vim.g.loaded_shada_plugin = 1
-- vim.g.loaded_spellfile_plugin = 1
-- vim.g.loaded_tarPlugin = 1
-- vim.g.loaded_tutor_mode_plugin = 1
-- vim.g.loaded_zipPlugin = 1
-- vim.g.skip_loading_mswin = 1

-- Read setting files from Lua directory.
require("base")
require("options")
require("keymaps")
-- require("colorscheme")
require("plugins")

-- Packer commands
-- vim.api.nvim_create_user_command("PackerInstall", [[packadd packer.nvim | lua require("packers").install()]],
--   { bang = true })
-- vim.api.nvim_create_user_command("PackerUpdate", [[packadd packer.nvim | lua require("packers").update()]],
--   { bang = true })
-- vim.api.nvim_create_user_command("PackerSync", [[packadd packer.nvim | lua require("packer").sync()]], { bang = true })
-- vim.api.nvim_create_user_command("PackerClean", [[packadd packer.nvim | lua require("packers").clean()]], { bang = true })
-- vim.api.nvim_create_user_command("PackerCompile", [[packadd packer.nvim | lua require("packers").compile()]],
--   { bang = true })
