local override = require "custom.plugins.override"

return {
  -- Overrides
  ["nvim-treesitter/nvim-treesitter"] = {
    override_options = override.treesitter,
  },
  ["williamboman/mason.nvim"] = {
    override_options = override.mason,
  },
  ["kyazdani42/nvim-tree.lua"] = {
    override_options = override.nvimtree,
  },
  ["nvim-telescope/telescope.nvim"] = {
    override_options = override.telescope,
  },

  -- New plugins
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
  ["simrat39/rust-tools.nvim"] = {
    after = "nvim-lspconfig",
    config = function()
      require("custom.plugins.rust-tools").setup()
    end,
  },
  ["p00f/clangd_extensions.nvim"] = {
    after = "nvim-lspconfig",
    config = function()
      require("custom.plugins.clangd-extensions").setup()
    end,
  },
  ["Vonr/align.nvim"] = {
    config = function()
      require("custom.plugins.align").setup()
    end,
  },
  -- ["folke/noice.nvim"] = {
  --   event = "VimEnter",
  --   config = function()
  --     require("custom.plugins.noice").setup()
  --   end,
  --   requires = {
  --     -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
  --     "MunifTanjim/nui.nvim",
  --     "rcarriga/nvim-notify",
  --   },
  -- },
  ["pwntester/octo.nvim"] = {
    requires = {
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope.nvim",
      "kyazdani42/nvim-web-devicons",
    },
    config = function()
      require("octo").setup()
    end,
  },
  ["DanielVolchek/tailiscope.nvim"] = {
    after = "telescope.nvim",
  },
  ["hrsh7th/nvim-cmp"] = {
    override_options = {
      sources = {
        { name = "nvim_lsp" },
        { name = "buffer" },
        { name = "nvim_lua" },
        { name = "path" },
        { name = "luasnip" },
        { name = "crates" },
        { name = "emoji" },
      },
    },
  },
  ["saecki/crates.nvim"] = {
    event = { "BufRead Cargo.toml" },
    requires = { "nvim-lua/plenary.nvim" },
    config = function()
      require("crates").setup()
    end,
  },
  ["hrsh7th/cmp-emoji"] = {},
  ["williamboman/mason-lspconfig.nvim"] = {},
  ["mizlan/iswap.nvim"] = {},
  ["iamcco/markdown-preview.nvim"] = {},
  ["tpope/vim-fugitive"] = {},
  ["mfussenegger/nvim-jdtls"] = {},
  ["github/copilot.vim"] = {},
  ["glacambre/firenvim"] = {
    run = function()
      vim.fn["firenvim#install"](0)
    end,
  },
}
