local M = {}

M.telescope = {
  n = {
    ["<leader>fp"] = { "<cmd>Telescope media_files <CR>", "  find media" },
  },
}

M.copilot = {
  i = {
    ["<C-j>"] = {
      'copilot#Accept("<CR>")',
      "ﮧ  copilot completion",
      opts = {
        silent = true,
        script = true,
        expr = true,
      },
    },
  },
}

M.general = {
  n = {
    ["<ESC>"] = { "<cmd> noh <CR>", "Remove Highlights" },
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

-- vim.g.copilot_no_tab_map = true
-- vim.g.copilot_assume_mapped = true

return M
