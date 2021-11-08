local hooks = require "core.hooks"

local opts = { noremap = true, silent = true }

hooks.add("setup_mappings", function(map)
   -- Copilot
   map("n", "<A-i>", '<CMD>lua require("FTerm").toggle()<CR>', opts)
   map("t", "<A-i>", '<C-\\><C-n><CMD>lua require("FTerm").toggle()<CR>', opts)
end)
