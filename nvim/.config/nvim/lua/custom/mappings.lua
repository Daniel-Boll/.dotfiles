local M = {}

M.telescope = {
  n = {
    ["<leader>fp"] = { "<cmd>Telescope media_files <CR>", "  find media" },
  },
}

M.general = {
  n = {
    ["<ESC>"] = { "<cmd> noh <CR>", "Remove Highlights" },
  },
}

M.rc = {
  n = {
    ["<leader>r"] = { "<cmd>lua require('rust-tools').runnables.runnables() <CR>", "  runnables" },
  },
}

M.dap = {
  n = {
    ["F5"] = { "<cmd>lua require('dap').continue() <CR>", "  breakpoint" },
    ["<leader>b"] = { "<cmd>lua require('dap').toggle_breakpoint() <CR>", "  breakpoint" },
    ["<leader>n"] = { "<cmd>lua require('dap').step_over() <CR>", "  breakpoint" },
    ["<leader>i"] = { "<cmd>lua require('dap').step_into() <CR>", "  breakpoint" },
  },
}

return M
