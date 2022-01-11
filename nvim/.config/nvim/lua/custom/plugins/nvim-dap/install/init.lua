local hooks = require("core.hooks")

hooks.add("install_plugins", function(use)
  use({ "Pocco81/DAPInstall.nvim" })
end)
