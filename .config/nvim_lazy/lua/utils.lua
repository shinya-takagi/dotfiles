-- From https://github.com/jdhao/nvim-config
local fn = vim.fn
local M = {}

function M.executable
  if fn.executable(name) > 0 then
    return true
  end

  return false
end

--- check whether a feature exists in Nvim
--- @feat: string
---   the feature name, like `nvim-0.7` or `unix`.
--- return: bool
M.has = function(feat)
  if fn.has(feat) == 1 then
    return true
  end

  return false
end

--- Create a dir if it does not exist
function M.may_create_dir(dir)
  local res = fn.isdirectory(dir)

  if res == 0 then
    fn.mkdir(dir, "p")
  end
end

function M.get_nvim_version()
  local actual_ver = vim.version()

  local nvim_ver_str = string.format("%d.%d.%d", actual_ver.major, actual_ver.minor, actual_ver.patch)
  return nvim_ver_str
end

return M
