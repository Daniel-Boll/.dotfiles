local hooks = require("core.hooks")

hooks.add("install_plugins", function(use)
  use({ "nvim-telescope/telescope-ui-select.nvim" })
end)
