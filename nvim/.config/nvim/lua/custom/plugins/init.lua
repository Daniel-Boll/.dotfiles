return {
  ["windwp/nvim-ts-autotag"] = {
    ft = { "html", "javascriptreact" },
    after = "nvim-treesitter",
    config = function()
      require("nvim-ts-autotag").setup()
    end,
  },
  ["jose-elias-alvarez/null-ls.nvim"] = {
    after = "nvim-lspconfig",
    config = function()
      require("custom.plugins.null-ls").setup()
    end,
  },
  ["nvim-telescope/telescope-media-files.nvim"] = {
    after = "telescope.nvim",
    config = function()
      require("telescope").load_extension "media_files"
    end,
  },
  ["karb94/neoscroll.nvim"] = {
    config = function()
      require("neoscroll").setup {
        mappings = { "<C-u>", "<C-d>" },
      }
    end,
  },
  ["folke/todo-comments.nvim"] = {
    requires = "nvim-lua/plenary.nvim",
    config = function()
      require("todo-comments").setup {}
    end,
  },
  ["kylechui/nvim-surround"] = {
    config = function()
      require("nvim-surround").setup {}
    end,
  },
  ["neovim/nvim-lspconfig"] = {
    config = function()
      require "plugins.configs.lspconfig"
      require "custom.plugins.lspconfig"
    end,
  },
  ["mfussenegger/nvim-dap"] = {
    config = function()
      require("custom.plugins.dap").setup()
    end,
  },
  ["iamcco/markdown-preview.nvim"] = {},
  ["tpope/vim-fugitive"] = {},
  ["mfussenegger/nvim-jdtls"] = {},
  ["github/copilot.vim"] = {},
}
