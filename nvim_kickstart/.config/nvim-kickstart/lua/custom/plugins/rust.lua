vim.g.rustaceanvim = {
  server = {
    on_attach = function(_, bufnr)
      vim.keymap.set('n', '<leader>cR', function()
        vim.cmd.RustLsp 'codeAction'
      end, { desc = 'Code Action', buffer = bufnr })
      vim.keymap.set('n', '<leader>dr', function()
        vim.cmd.RustLsp 'debuggables'
      end, { desc = 'Rust Debuggables', buffer = bufnr })
    end,
    tools = {
      enable_clippy = true,
    },
    default_settings = {
      -- ['rust-analyzer'] = {
      --   cargo = {
      --     allFeatures = true,
      --     loadOutDirsFromCheck = true,
      --     buildScripts = {
      --       enable = true,
      --     },
      --   },
      --   checkOnSave = false,
      --   diagnostics = {
      --     enable = false,
      --   },
      --   procMacro = {
      --     enable = true,
      --     ignored = {
      --       ['async-trait'] = { 'async_trait' },
      --       ['napi-derive'] = { 'napi' },
      --       ['async-recursion'] = { 'async_recursion' },
      --     },
      --   },
      --   files = {
      --     excludeDirs = {
      --       '.direnv',
      --       '.git',
      --       '.github',
      --       '.gitlab',
      --       'bin',
      --       'node_modules',
      --       'target',
      --       'venv',
      --       '.venv',
      --     },
      --   },
      -- },
    },
  },
}

return {
  {
    'Saecki/crates.nvim',
    event = { 'BufRead Cargo.toml' },
    opts = {
      completion = {
        crates = {
          enabled = true,
        },
      },
      lsp = {
        enabled = true,
        actions = true,
        completion = true,
        hover = true,
      },
    },
  },
  {
    'neovim/nvim-lspconfig',
    opts = {
      servers = {
        bacon_ls = {
          enabled = true,
        },
        rust_analyzer = { enabled = false },
      },
    },
  },
  {
    'mrcjkb/rustaceanvim',
    version = '^6',
    ft = { 'rust' },
    lazy = false,
  },
}
