local M = {}

M.general = {
  -- Normal mode
  n = {
    ["<leader>sf"] = { "<cmd> echo $MYVIMRC <CR>", "Show my vimrc"},
    ["<leader>sw"] = { "<cmd> w <CR>", "Save the file"},
  },
  i = {
    -- Disable movement in Insert Mode.
    ["<Left>"] = {""},
    ["<Right>"] = {""},
    ["<Up>"] = {""},
    ["<Down>"] = {""},
  },
}

return M
