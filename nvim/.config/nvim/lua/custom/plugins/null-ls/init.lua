local ok, null_ls = pcall(require, "null-ls")

if not ok then
  return
end

local builtins = null_ls.builtins

local sources = {
  -- JS html css stuff
  builtins.formatting.prettierd.with {
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
  },
  builtins.diagnostics.eslint.with {
    command = "eslint_d",
  },

  -- Lua
  builtins.formatting.stylua,
  builtins.diagnostics.luacheck.with {
    extra_args = { "--globuiltinsal vim" },
  },

  -- Shell
  builtins.formatting.shfmt,
  builtins.diagnostics.shellcheck.with { diagnostics_format = "#{m} [#{c}]" },
  builtins.code_actions.shellcheck,

  -- Rust
  builtins.formatting.rustfmt,
  -- builtins.formatting.rustfmt.with {
  --   extra_args = { "--edition=2021", "--config tab_spaces=2" },
  -- },

  -- Cmake
  builtins.formatting.cmake_format.with {
    filetypes = { "cmake", "CMakeLists.txt" },
  },

  -- Java
  builtins.formatting.google_java_format,

  -- CPP
  builtins.formatting.clang_format.with {
    filetypes = { "c", "cpp", "h", "hpp", "cc", "hh", "cxx", "hxx" },
  },
  builtins.diagnostics.cppcheck,

  builtins.formatting.pg_format.with {
    filetypes = { "pgsql" },
  },

  -- Python
  builtins.formatting.black,
  -- builtins.diagnostics.flake8,

  -- Git sign
  -- builtins.code_actions.gitsigns,

  -- Java
  -- builtins.formatting.google_java_format,
  -- builtins.diagnostics.semgrep,

  -- Docker
  builtins.diagnostics.hadolint,

  -- gRPC
  builtins.diagnostics.protolint,

  -- Golang
  builtins.formatting.goimports,
  builtins.diagnostics.golangci_lint,

  -- Zig
  builtins.formatting.zigfmt,

  -- Elixir
  builtins.diagnostics.credo,
  builtins.formatting.mix,

  -- Prisma
  builtins.formatting.prismaFmt,
}

local M = {}
M.setup = function()
  null_ls.setup {
    debug = true,
    sources = sources,
  }
end

return M
