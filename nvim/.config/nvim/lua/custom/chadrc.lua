---@type ChadrcConfig
local M = {}

-- Path to overriding theme and highlights files
local highlights = require "custom.highlights"

M.ui = {
  theme = "gruvbox",
  theme_toggle = { "gruvbox", "one_light" },

  hl_override = highlights.override,
  hl_add = highlights.add,

  changed_themes = {
    gruvbox = {
      base_30 = {
        darker_black = "#232323",
        black = "#000000", --  nvim bg
        black2 = "#2e2e2e",
        one_bg = "#353535",
      },
      base_16 = {
        base00 = "#000000",
      },
    },
  },

  statusline = {
    theme = "default",
    separator_style = "round",
  },

  telescope = {
    style = "bordered", -- borderless / bordered
  },
}

M.plugins = "custom.plugins"

-- check core.mappings for table structure
M.mappings = require "custom.mappings"

return M
