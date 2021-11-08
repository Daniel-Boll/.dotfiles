local hooks = require "core.hooks"

hooks.add("install_plugins", function(use)
  use { "github/copilot.vim" }
end)
