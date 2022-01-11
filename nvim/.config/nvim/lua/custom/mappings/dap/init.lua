local hooks = require("core.hooks")

local opts = { noremap = true, silent = true }

hooks.add("setup_mappings", function(map)
  -- Add breakpoints
  map("n", "<leader>b", "<cmd>lua require('dap').toggle_breakpoint()<cr>", opts)
  map("n", "<F7>", "<cmd>lua require('dap').continue()<cr>", opts)
end)
