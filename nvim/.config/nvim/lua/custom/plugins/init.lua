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
  {
    "folke/trouble.nvim",
    requires = "kyazdani42/nvim-web-devicons",
    config = function()
      require("trouble").setup({})
    end,
  },
  { "iamcco/markdown-preview.nvim" },
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
  {
    "gelguy/wilder.nvim",
    config = function()
      require("wilder").setup()
    end,
  },
  { "tikhomirov/vim-glsl" },
  { "tpope/vim-eunuch" }
  -- {
  --   "NvChad/nvterm",
  --   config = function()
  --     require("custom.plugins.nvterm.conf").setup()
  --   end,
  -- },
}
