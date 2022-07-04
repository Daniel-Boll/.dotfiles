local M = {}

local userPlugins = require "custom.plugins"
local override = require "custom.override"

M.plugins = {
  options = {
    lspconfig = {
      setup_lspconf = "custom.plugins.lspconfig",
    },
  },

  override = {
    ["kyazdani42/nvim-tree.lua"] = override.nvimtree,
    ["nvim-treesitter/nvim-treesitter"] = override.treesitter,
    ["akinsho/bufferline.nvim"] = override.bufferline,
  },

  user = userPlugins,

  remove = {
    "folke/which-key.nvim",
  },
}

M.options = {
  user = function()
    vim.opt.relativenumber = true
    vim.opt.wrap = false
    vim.opt.scrolloff = 12
  end,
}

M.ui = {
  theme = "radium",
  theme_toggle = { "radium", "one_light" },
  -- transparency = true
}

M.mappings = require "custom.mappings"

return M
