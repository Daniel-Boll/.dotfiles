local customPlugins = require("core.customPlugins")

customPlugins.add(function(use)
  use({
    "jose-elias-alvarez/null-ls.nvim",
    after = "nvim-lspconfig",
    config = function()
      require("custom.plugins.null-ls.conf").setup()
    end,
  })
end)
