local function split(input, delimiter)
  local arr = {}
  string.gsub(input, "[^" .. delimiter .. "]+", function(w)
    table.insert(arr, w)
  end)
  return arr
end

local function get_venv()
  local venv = vim.env.VIRTUAL_ENV
  if venv then
    local params = split(venv, "/")
    return "(env:" .. params[table.getn(params) - 1] .. ")"
  else
    return ""
  end
end

return {
  "nvim-lualine/lualine.nvim",

  opts = function()
    return {
      options = {
        -- themes = "monokai-pro",
        -- themes = "vscode",
        themes = "tokyonight",
      },
      sections = {
        lualine_x = { { get_venv, color = { gui = "bold" } } },
      },
    }
  end,
}
