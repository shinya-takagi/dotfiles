local status, code = pcall(require, 'code_runner')
if (not status) then return end


code.setup({
  filetype = {
    python = "python3 -u",
    bash = "bash "
  },
})
