local hooks = require "core.hooks"

hooks.add("install_plugins", function(use)
  use { "kristijanhusak/vim-dadbod-ui" }
end)
