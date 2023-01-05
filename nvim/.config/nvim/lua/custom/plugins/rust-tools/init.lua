local present, rusttools = pcall(require, "rust-tools")
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
  rusttools.setup(options)
end

return M
