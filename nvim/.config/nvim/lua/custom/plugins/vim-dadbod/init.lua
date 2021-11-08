local hooks = require "core.hooks"

hooks.add("install_plugins", function(use)
  use { "tpope/vim-dadbod" }
end)
