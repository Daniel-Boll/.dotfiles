local hooks = require "core.hooks"

hooks.add("setup_mappings", function(map)
   -- Copilot
   map("i", "<C-j>", 'copilot#Accept("<CR>")', { silent = true, script = true, expr = true })
end)

