local M = {}

-- Add highlight to when in insert mode cursor be block if highlight green
-- and in normal mode cursor be block if highlight blue
vim.cmd[[
 set guicursor=i:block
 set guifont=Iosevka\ 12
 set so=12
]]

M.options = {
  relativenumber = true,
}

M.ui = {
  theme = "chadracula",
  transparency = true,
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
}

return M
