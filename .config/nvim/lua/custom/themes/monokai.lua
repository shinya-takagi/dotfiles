local M = {}

M.base_30 = {
  white = "#d6d6d6",
  darker_black = "#282828", -- 6% darker than black
  black = "#2e2e2e", -- nvim background
  black2 = "#343434", -- 6% lighter than black
  onebg = "#383838", -- 10% lighter than black
  oneb2 = "#414141", -- 19% lighter than black
  oneb3 = "#494949", -- 27% lighter than black
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
  teal = "#6491b3", -- 8% darker than blue

  yellow = "#e5b567",
  green = "#b4d273",
  orange = "#e87d3e",
  purple = "#9e86c8",
  pink = "#b05279",
  blue = "#6c99bb",
  red = "#f92672",

  statusline_bg = "#323232", -- 4% lighter than black
  lightbg = "#3f3f3f", -- 13% lighter than statusline_bg
  lightbg2 = "#393939", -- 7% lighter than statusline_bg
  folder_bg = "#6c99bb", -- blue
}

M.base_16 = {
  base00 = "#2e2e2e", -- background
  base01 = "#2e2e2e", -- lighter bg status bar
  base02 = "#383838", -- Selection background
  base03 = "#797979", -- comment out
  base04 = "#5a5a5a", -- foreground
  base05 = "#a0a0a0", -- default foreground
  base06 = "#b4b4b4", -- Lighter fg
  base07 = "#c0c0c0", -- Lighter bg
  base08 = "#e87d3e", -- variables
  base09 = "#9e86c8", -- Constant
  base0A = "#6c99bb", -- Class
  base0B = "#b4d273", -- Strings
  base0C = "#e5b567", -- Escape characters
  base0D = "#b4d273", -- Functions
  base0E = "#f92672", -- Keywords
  base0F = "#c9c6c2", -- Language tags, Deprecated
}
M.polish_hl = {
  ["@field"] = { fg = M.base_30.green },
  ["@parameter"] = { fg = M.base_30.cyan },
  ["@keyword"] = { fg = M.base_30.blue },
  ["@variable"] = { fg = M.base_30.orange },
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
