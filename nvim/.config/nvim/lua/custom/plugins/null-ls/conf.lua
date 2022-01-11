local ok, null_ls = pcall(require, "null-ls")

if not ok then
  return
end

local builtins = null_ls.builtins

local sources = {
  -- JS html css stuff
  builtins.formatting.prettierd.with({
    filetypes = {
      "html",
      "json",
      "markdown",
      "scss",
      "css",
      "javascript",
      "javascriptreact",
      "typescript",
      "typescriptreact",
    },
  }),
  builtins.diagnostics.eslint.with({
    command = "eslint_d",
  }),

  -- Lua
  builtins.formatting.stylua,
  builtins.diagnostics.luacheck.with({
    extra_args = { "--globuiltinsal vim" },
  }),

  -- Shell
  builtins.formatting.shfmt,
  builtins.diagnostics.shellcheck.with({ diagnostics_format = "#{m} [#{c}]" }),

  -- Rust
  builtins.formatting.rustfmt,
}

local M = {}
M.setup = function()
  null_ls.setup({ sources = sources })
end

return M
