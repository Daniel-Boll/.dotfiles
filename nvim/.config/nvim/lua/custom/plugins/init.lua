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
  ["andreadev-it/shade.nvim"] = {
    module = "shade",
    config = function()
      require("shade").setup {
        overlay_opacity = 50,
        opacity_step = 1,
        exclude_filetypes = { "NvimTree" },
      }
    end,
  },
  ["rmagatti/auto-session"] = {
    config = function()
      require("auto-session").setup {
        log_level = "info",
        auto_session_suppress_dirs = { "~/" },
      }
    end,
  },
  ["github/copilot.vim"] = {},
  ["tpope/vim-surround"] = {},
  ["mfussenegger/nvim-jdtls"] = {},
  ["iamcco/markdown-preview.nvim"] = {},
  -- ["hrsh7th/cmp-emoji"] = {
  --   after = "cmp",
  -- },
}
