local present, ce = pcall(require, "clangd_extensions")
local attach = require("plugins.configs.lspconfig").on_attach
local capabilities = require("plugins.configs.lspconfig").capabilities

if not present then
  return
end

local M = {}

M.setup = function()
  local options = {
    server = {
      on_attach = attach,
      capabilities = capabilities,
      flags = {
        debounce_text_changes = 150,
      },
    },
  }
  ce.setup(options)
end

return M
