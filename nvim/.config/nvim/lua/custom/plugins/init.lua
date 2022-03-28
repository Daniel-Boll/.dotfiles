return {
  {
    "folke/todo-comments.nvim",
    requires = "nvim-lua/plenary.nvim",
    config = function()
      require("todo-comments").setup({})
    end,
  },
  { "github/copilot.vim" },
  { "numtostr/FTerm.nvim" },
  {
    "windwp/nvim-ts-autotag",
    ft = { "html", "javascriptreact", "typescriptreact" },
    after = "nvim-treesitter",
    config = function(attach, capabilities)
      require("nvim-ts-autotag").setup({
        server = {
          attach = attach,
          capabilities = capabilities,
        },
      })
    end,
  },
  { "tpope/vim-surround" },
  {
    "jose-elias-alvarez/null-ls.nvim",
    after = "nvim-lspconfig",
    config = function()
      require("custom.plugins.null-ls.conf").setup()
    end,
  },
  { "nvim-telescope/telescope-media-files.nvim" },
  { "nvim-telescope/telescope-symbols.nvim" },
  { "nvim-telescope/telescope-ui-select.nvim" },
  -- {
  --   "p00f/clangd_extensions.nvim",
  --   config = function()
  --     require("clangd_extensions").setup({
  --       server = {
  --         capabilities = require "plugins.configs.lspconfig".capabilities,
  --         on_attach = require "plugins.configs.lspconfig".on_attach,
  --       }
  --     })
  --   end,
  -- },
  {
    "folke/trouble.nvim",
    requires = "kyazdani42/nvim-web-devicons",
    config = function()
      require("trouble").setup({
        -- your configuration comes here
        -- or leave it empty to use the default settings
        -- refer to the configuration section below
      })
    end,
  },
  -- {
  --   "mvllow/modes.nvim",
  --   config = function()
  --     vim.opt.cursorline = true
  --     require("modes").setup()
  --   end,
  -- },
  { "iamcco/markdown-preview.nvim" },
  -- { "mg979/vim-visual-multi" },
  {
    "s1n7ax/nvim-comment-frame",
    requires = "nvim-treesitter",
    config = function()
      require("nvim-comment-frame").setup({
        keymap = "<leader>.",
        multiline_keymap = "<leader>b",
      })
    end,
  },
  { "gelguy/wilder.nvim" }
}
