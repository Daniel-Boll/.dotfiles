local map = require("core.utils").map

map("n", "<leader>b", "<cmd>lua require('dap').toggle_breakpoint()<cr>")
map("n", "<F7>", "<cmd>lua require('dap').continue()<cr>")
