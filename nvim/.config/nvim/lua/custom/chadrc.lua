local M = {}

local userPlugins = require "custom.plugins"
local override = require "custom.override"

M.plugins = {
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

M.ui = {
  theme = "radium",
  theme_toggle = { "radium", "one_light" },
  -- transparency = true
}

M.mappings = require "custom.mappings"

return M
