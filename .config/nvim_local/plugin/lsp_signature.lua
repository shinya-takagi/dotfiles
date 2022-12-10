-- Setup lsp_signature
local status_ok, signature = pcall(require, "lsp_signature")
if (not status_ok) then return end

local cfg = {}
signature.setup(cfg)
signature.on_attach()
