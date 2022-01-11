local hooks = require("core.hooks")

hooks.add("install_plugins", function(use)
  use({
    "mfussenegger/nvim-dap",
    config = function()
      require("custom.plugins.nvim-dap.conf").setup()
    end,
  })
end)
