-- Use functions of vim built-in
local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system({
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  })
  print("Installing packer close and reopen Neovim...")
  vim.cmd([[packadd packer.nvim]])
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]])

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  return
end

-- Have packer use a popup window
packer.init({
  display = {
    open_fn = function()
      return require("packer.util").float({ border = "rounded" })
    end,
  },
})


-- Install plugins
return packer.startup(function(use)
  use({ 'wbthomason/packer.nvim' })
  use({ 'nvim-lua/plenary.nvim' }) -- Common utilities

  -- Colorschemes
  use({ 'tanvirtin/monokai.nvim' })
  use({ 'EdenEast/nightfox.nvim' }) -- Color scheme
  use({ 'sainnhe/sonokai' })

  -- Utilities
  use({ 'windwp/nvim-autopairs' }) -- Autocomplete pairs
  use({ 'RRethy/vim-illuminate' }) -- Illuminate same variables
  use({ 'SmiteshP/nvim-navic' }) -- Show function name.
  use({ 'simrat39/symbols-outline.nvim' }) -- Show Symbol at outline
  use({ 'lukas-reineke/indent-blankline.nvim' }) -- Show indent line blank
  use({ 'rcarriga/nvim-notify' }) -- Show Notification popup
  use({ 'folke/noice.nvim' }) -- Richment notice
  use({ 'MunifTanjim/nui.nvim' }) -- UI Component
  use({ 'ethanholz/nvim-lastplace' }) -- Remember last position when it opened.
  -- Vim Compatibles
  use({ 'machakann/vim-sandwich' }) -- Add operator surrounding
  -- use({ 'thinca/vim-quickrun' }) -- Quickly run the code in buffer.
  -- use({ 'lambdalisue/vim-quickrun-neovim-job' }) -- For neovim quickrun job
  use({ 'is0n/jaq-nvim' }) -- Quickrun for neovim.
  use({ 'CRAG666/code_runner.nvim', requires = 'nvim-lua/plenary.nvim' }) -- Code runner for Neovim
  use {
    'folke/which-key.nvim',
    config = function()
      require("which-key").setup {}
    end
  } -- Show Key binding

  -- LSP
  use({ 'williamboman/mason.nvim' })
  use({ 'williamboman/mason-lspconfig.nvim' })
  use({ 'neovim/nvim-lspconfig' })
  use({ 'ray-x/lsp_signature.nvim' }) -- Show signature help on function
  use({ 'folke/lsp-colors.nvim' }) -- Add LSP colors
  use({ 'kkharji/lspsaga.nvim' }) -- Lsp helper
  use({ 'folke/trouble.nvim' }) -- Show warning/error like VSCode
  use({ 'onsails/lspkind.nvim' }) -- Show icons in completion on lsp

  -- Completions
  use({ 'hrsh7th/nvim-cmp' }) -- cmp engine
  use({ 'hrsh7th/cmp-nvim-lsp' }) -- LSP completions
  use({ 'hrsh7th/cmp-buffer' }) -- buffer completions
  use({ 'hrsh7th/cmp-path' }) -- path completions
  use({ 'hrsh7th/cmp-cmdline' }) -- command line completions
  use({ 'hrsh7th/vim-vsnip' }) -- Snipet like VSCode

  -- Treesitter
  use({ 'nvim-treesitter/nvim-treesitter' }) -- Treesitter Engine
  use({ 'ray-x/cmp-treesitter' })
  use({ 'JoosepAlviste/nvim-ts-context-commentstring' }) -- treesitter plugin show functions on cursor

  -- Linter formatter
  use({ 'jose-elias-alvarez/null-ls.nvim' }) -- Linter and formatter
  use({ 'mhartington/formatter.nvim' }) -- Formatter

  -- Git
  use({
    'lewis6991/gitsigns.nvim',
    config = function()
      require('gitsigns').setup()
    end
  }) -- Show git signs

  -- Status Line
  use({ 'nvim-lualine/lualine.nvim' }) -- Powerline fonts for neovim
  use({ 'kyazdani42/nvim-web-devicons' }) -- Various icons for neovim

  -- Sidebar
  use({ 'GustavoKatel/sidebar.nvim', cmd = "SidebarNvimToggle" }) -- Add sidebar

  -- Scroll bar
  use({ 'petertriho/nvim-scrollbar' }) -- Add scrollbar
  use { 'kevinhwang91/nvim-hlslens' } -- Counts of highlight words

  -- Filer
  use({ 'kyazdani42/nvim-tree.lua' }) -- Neovim tree

  -- Fuzzy Finder
  use({ 'nvim-telescope/telescope.nvim' }) -- lua made in fuzzy finder
  use {
    'nvim-telescope/telescope-frecency.nvim',
    config = function()
      require 'telescope'.load_extension('frecency')
    end,
    requires = { 'kkharji/sqlite.lua' }
  } -- Extension of Telescope for search files

  -- Screen
  use({ 'goolord/alpha-nvim' }) -- Custom menu

  -- Terminal
  use { 'akinsho/toggleterm.nvim', config = function()
    require('toggleterm').setup()
  end } -- Improved builtin-Terminal

  -- Specific Language
  use({ 'folke/neodev.nvim' }) -- Develop for lua
  use({ 'lervag/vimtex', ft = { "tex" } }) -- All-in-one LaTeX for vim/neovim

  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end

end)
