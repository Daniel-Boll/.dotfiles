local M = {}
M.options, M.ui, M.mappings, M.plugins = {}, {}, {}, {}

M.options = {
   relativenumber = true,
}

M.ui = {
  theme = "doom-chad"
}

M.plugins = {
   options = {
    lspconfig = {
     setup_lspconf = "custom.plugins.lspconfig",
    },
   },
   default_plugin_config_replace = {
     nvim_cmp = "custom.plugins.cmp"
   },
}

return M
