local M = {}

M.setup_lsp = function(attach, capabilities)
   local lspconfig = require "lspconfig"

   -- lspservers with default config
   local servers = {
      "html",
      "cssls",
      "pyright",
      "rust_analyzer",
      "solargraph",
      "sumneko_lua",
      "tsserver",
      "clangd",
      "bashls",
      "emmet_ls",
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

   -- Specific configs

   -- Unity
   local pid = vim.fn.getpid()

   lspconfig.omnisharp.setup {
      cmd = { "omnisharp", "--languageserver", "--hostPID", tostring(pid) },
      root_dir = lspconfig.util.root_pattern("*.csproj", "*.sln"),
      on_attach = attach,
      capabilities = capabilities,
   }

   -- Lua
   local sumneko_root_path = "lua-language-server"
   local sumneko_binary = "lua-language-server"

   local runtime_path = vim.split(package.path, ";")
   table.insert(runtime_path, "lua/?.lua")
   table.insert(runtime_path, "lua/?/init.lua")
   lspconfig.sumneko_lua.setup {
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
   }


   local system_name = "Linux"
   local sumneko_root_path = "/home/daniel/git-stuff/lua-language-server"
   local sumneko_binary = sumneko_root_path .. "/bin/" .. system_name .. "/lua-language-server"

   local runtime_path = vim.split(package.path, ";")
   table.insert(runtime_path, "lua/?.lua")
   table.insert(runtime_path, "lua/?/init.lua")
end

return M
