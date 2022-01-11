local customPlugins = require("core.customPlugins")

customPlugins.add(function(use)
  use({
    "mfussenegger/nvim-dap",
    config = function()
      require("custom.plugins.nvim-dap.conf").setup()
    end,
  })
end)
