local attach = require("plugins.configs.lspconfig").on_attach
local capabilities = require("plugins.configs.lspconfig").capabilities

local lspconfig = require "lspconfig"

-- lspservers with default config
local servers = {
  "html",
  "cssls",
  "pyright",
  "rust_analyzer",
  "sumneko_lua",
  "clangd",
  "bashls",
  "asm_lsp",
}

for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = attach,
    capabilities = capabilities,
    -- root_dir = vim.loop.cwd,
    flags = {
      debounce_text_changes = 150,
    },
  }
end

-- Clangd
local clangCapabilities = capabilities
clangCapabilities.offsetEncoding = { "utf-16" }
lspconfig.clangd.setup {
  capabilities = clangCapabilities,
  on_attach = attach,
}

-- Typescript
local function organize_imports()
  local params = {
    command = "_typescript.organizeImports",
    arguments = { vim.api.nvim_buf_get_name(0) },
    title = "",
  }
  vim.lsp.buf.execute_command(params)
end

lspconfig.tsserver.setup {
  on_attach = attach,
  capabilities = capabilities,
  flags = {
    debounce_text_changes = 150,
  },
  commands = {
    OrganizeImports = {
      organize_imports,
      description = "Organize Imports",
    },
  },
}

-- Unity
-- local pid = vim.fn.getpid()
--
-- lspconfig.omnisharp.setup {
--   cmd = { "omnisharp", "--languageserver", "--hostPID", tostring(pid) },
--   root_dir = lspconfig.util.root_pattern("*.csproj", "*.sln"),
--   on_attach = attach,
--   capabilities = capabilities,
-- }

-- Java
-- lspconfig.jdtls.setup {
--   on_attach = attach,
--   capabilities = capabilities,
--   cmd = { "jdtls" },
--   root_dir = lspconfig.util.root_pattern("pom.xml", "*.java"),
--   single_file_support = true,
-- }
