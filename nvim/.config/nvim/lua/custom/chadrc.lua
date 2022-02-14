local M = {}

M.options = {
  relativenumber = true,
}

M.ui = {
  theme = "chadracula",
  transparency = false,
}

M.plugins = {
  options = {
    lspconfig = {
      setup_lspconf = "custom.plugins.lspconfig",
    },
  },
  default_plugin_config_replace = {
    nvim_cmp = "custom.plugins.cmp",
    telescope = "custom.plugins.telescope",
  },
  install = require "custom.plugins",
}

return M
