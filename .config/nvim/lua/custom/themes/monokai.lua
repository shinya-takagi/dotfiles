local M = {}

M.base_30 = {
  white = "#d6d6d6",
  darker_black = "#282828", -- 6% darker than black
  black = "#2e2e2e", -- nvim background
  black2 = "#343434", -- 6% lighter than black
  one_bg = "#383838", -- 10% lighter than black
  one_bg2 = "#414141", -- 19% lighter than black
  one_bg3 = "#494949", -- 27% lighter than black
  grey = "#565656", -- 40% lighter than black, basement grey color
  grey_fg = "#606060", -- 10% ligher than grey
  grey_fg2 = "#6a6a6a", -- 20% ligher than grey
  light_grey = "#727272", -- 28% ligher than grey

  baby_pink = "#ff3581", -- 15% lighter than red or any baby_pink color
  line = "#3d3d3d", -- 15% ligther than black

  nord_blue = "#5d8aac", -- 13% darker than blue
  sun = "#f4c476", -- 8% lighter than yellow
  vibrant_green = "#b6d475", -- 2% lighter than green
  dark_purple = "#947cbe", -- 10% darker than purple
  cyan = "#6794b6", -- 5% darker than blue
  teal = "#6491f3", -- 8% darker than blue

  yellow = "#e6db74",
  green = "#a6e22e",
  green2 = "#86f22e",
  orange = "#fd971f",
  purple = "#ae81ff",
  pink = "#b05279",
  blue = "#66d9ef",
  red = "#f92672",

  statusline_bg = "#323232", -- 4% lighter than black
  lightbg = "#3f3f3f", -- 13% lighter than statusline_bg
  lightbg2 = "#393939", -- 7% lighter than statusline_bg
  folder_bg = "#6c99bb", -- blue
  pmenu_bg = "#66a0bb", -- Menu(Completion color on command line)
}

M.base_16 = {
  base00 = "#0e0e0e", -- background
  base01 = "#1e1e1e", -- lighter bg status bar
  base02 = "#282828", -- Selection background
  base03 = "#393939", -- comment out
  base04 = "#5a5a5a", -- foreground
  base05 = "#d0d0d0", -- default foreground
  base06 = "#e4e4e4", -- Lighter fg
  base07 = "#FFFFFF", -- Lighter bg
  base08 = "#0491f3", -- variables
  base09 = "#9e86c8", -- Constant
  base0A = "#6c99bb", -- Class
  base0B = "#b4d273", -- Strings
  base0C = "#e88d3e", -- Escape characters
  base0D = "#a6e22e", -- Functions
  base0E = "#f92672", -- Keywords
  base0F = "#c9c6c2", -- Language tags, Deprecated
}
M.polish_hl = {
  ["@field"] = { fg = M.base_30.green },
  ["@parameter"] = { fg = M.base_30.sun },
  ["@keyword"] = { fg = M.base_30.blue },
  ["@variable"] = { fg = M.base_30.white },
  ["@field.key"] = { fg = M.base_30.cyan },
  ["@keywordreturn"] = { fg = M.base_30.red },
  ["@keywordfunction"] = { fg = M.base_30.green },
  ["@type.builtin"] = { fg = M.base_30.dark_purple },
  ["@constant.builtin"] = { fg = M.base_30.baby_pink },

  Include = { fg = M.base_30.purple },
  Constant = { fg = M.base_30.teal },
}

vim.opt.bg = "dark"

return M
