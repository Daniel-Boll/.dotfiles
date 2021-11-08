local hooks = require "core.hooks"

hooks.add("install_plugins", function(use)
  use { "pwntester/octo.nvim" }
end)
