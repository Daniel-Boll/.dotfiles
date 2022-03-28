local M = {}

M.setup_lsp = function(attach, capabilities)
  local lspconfig = require("lspconfig")

  -- lspservers with default config
  local servers = {
    "html",
    "cssls",
    "pyright",
    "rust_analyzer",
    "solargraph",
    "sumneko_lua",
    "clangd",
    "bashls",
    "emmet_ls",
  }

  for _, lsp in ipairs(servers) do
    lspconfig[lsp].setup({
      on_attach = attach,
      capabilities = capabilities,
      -- root_dir = vim.loop.cwd,
      flags = {
        debounce_text_changes = 150,
      },
    })
  end

  -- Specific configs
  -- SQL
  -- lspconfig.sqlls.setup({
  --   on_attach = attach,
  --   capabilities = capabilities,
  --   cmd = { "sql-language-server", "up", "--method", "stdio" },
  --   root_dir = vim.loop.cwd,
  --   filetypes = { "sql" },
  -- })

  -- Clangd
  local clangCapabilities = capabilities
  clangCapabilities.offsetEncoding = { "utf-16" }
  lspconfig.clangd.setup({
    capabilities = clangCapabilities,
    on_attach = attach,
  })

  -- Typescript
  local function organize_imports()
    local params = {
      command = "_typescript.organizeImports",
      arguments = { vim.api.nvim_buf_get_name(0) },
      title = "",
    }
    vim.lsp.buf.execute_command(params)
  end

  lspconfig.tsserver.setup({
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
  })

  -- Unity
  local pid = vim.fn.getpid()

  lspconfig.omnisharp.setup({
    cmd = { "omnisharp", "--languageserver", "--hostPID", tostring(pid) },
    root_dir = lspconfig.util.root_pattern("*.csproj", "*.sln"),
    on_attach = attach,
    capabilities = capabilities,
  })

  -- Lua
  local sumneko_root_path = "lua-language-server"
  local sumneko_binary = "lua-language-server"

  local runtime_path = vim.split(package.path, ";")
  table.insert(runtime_path, "lua/?.lua")
  table.insert(runtime_path, "lua/?/init.lua")
  lspconfig.sumneko_lua.setup({
    cmd = { sumneko_binary, "-E", sumneko_root_path .. "/main.lua" },
    on_attach = attach,
    capabilities = capabilities,
    settings = {
      Lua = {
        runtime = {
          version = "LuaJIT",
          path = runtime_path,
        },
        diagnostics = {
          globals = { "vim" },
        },
        workspace = {
          library = vim.api.nvim_get_runtime_file("", true),
        },
        telemetry = { enable = false },
      },
    },
  })

  -- Java
  lspconfig.jdtls.setup({
    on_attach = attach,
    capabilities = capabilities,
    cmd = { "jdtls" },
    root_dir = lspconfig.util.root_pattern("pom.xml", "*.java"),
    single_file_support = true,
  })
end

return M
