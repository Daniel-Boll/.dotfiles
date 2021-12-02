local hooks = require("core.hooks")

hooks.add("install_plugins", function(use)
  use({
    "jose-elias-alvarez/null-ls.nvim",
    after = "nvim-lspconfig",
    config = function()
      require("custom.plugins.null-ls.conf").setup()
    end,
  })
end)
