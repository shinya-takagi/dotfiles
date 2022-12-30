-- Colorscheme
local colorscheme = "nightfox"

if (colorscheme == "monokai") then
  local status_ok, monokai = pcall(require, "monokai")
  if (not status_ok) then return end

  monokai.setup({
    -- palette = monokai.pro
    -- palette = monokai.soda
    -- palette = monokai.ristretto
  })
elseif (colorscheme == "sonokai") then
  local status_ok, sonokai = pcall(require, "sonokai")
  if (not status_ok) then return end

  vim.g.sonokai_style = 'default'
  vim.g.sonokai_better_performance = 1

  sonokai.setup({

  })
  local status_lua, lualine = pcall(require, "lualine")
  if (status_lua) then
    lualine.setup({
      options = {
        theme = 'sonokai'
      }
    })
  end
elseif (colorscheme == 'nightfox') then
  local status_ok, nightfox = pcall(require, 'nightfox')
  if (not status_ok) then return end

  nightfox.setup({
    options = {
      styles = { -- Style to be applied to different syntax groups
        comments = "italic", -- Value is any valid attr-list value `:help attr-list`
        conditionals = "NONE",
        constants = "NONE",
        functions = "NONE",
        keywords = "NONE",
        numbers = "NONE",
        operators = "NONE",
        strings = "NONE",
        types = "NONE",
        variables = "NONE",
      },
    }

  })
  vim.cmd('colorscheme carbonfox')
end
