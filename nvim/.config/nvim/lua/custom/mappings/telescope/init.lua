local hooks = require("core.hooks")

local opts = { noremap = true, silent = true }

hooks.add("setup_mappings", function(map)
  map("n", "<leader>s", '<CMD>Telescope git_status<CR>', opts)
end)
